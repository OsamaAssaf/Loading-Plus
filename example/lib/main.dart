import 'package:flutter/material.dart';
import 'package:loading_plus/loading_plus.dart';

// Entry point of the application
void main() {
  // Run the MyApp widget as the root of the widget tree
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Loading Example',
      // Add (LoadingPlus) in your MaterialApp, it must be above all other screen in the widget tree.
      home: LoadingPlus(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> fetchData() async {
    LoadingPlusController().show(); // Show the default loading
    await Future.delayed(
        const Duration(seconds: 3)); // Simulate a time-consuming process
    LoadingPlusController()
        .dismiss(); // Hide the loading when the process is complete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Loading Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: fetchData,
              child: const Text('Fetch data'),
            ), // Button to trigger the fetchData function
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LoadingPage()));
              },
              child: const Text('Go to loading page'),
            ), // Button to navigate to the LoadingPage
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingPlusWidget(), // Show default loading widget
            SizedBox(height: 120.0),
            LoadingPlusWidget(
              customLoadingWidget: Center(
                child: Text('Loading...'),
              ),
            ), // Show a custom loading widget
          ],
        ),
      ),
    );
  }
}
