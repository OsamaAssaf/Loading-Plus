import 'package:flutter/material.dart';
import 'package:loading_plus/loading_plus.dart';

// Create a global key to uniquely identify the NavigatorState for the MaterialApp
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Entry point of the application
void main() {
  // Initialize the LoadingPlus package with the global navigator key
  LoadingPlus.instance.init(navigatorKey);

  // Run the MyApp widget as the root of the widget tree
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Loading Example',
      navigatorKey:
          navigatorKey, // Assigning the global navigator key to the MaterialApp
      home: const HomePage(),
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
    LoadingPlus.instance.show(); // Show the default loading dialog
    await Future.delayed(
        const Duration(seconds: 3)); // Simulate a time-consuming process
    LoadingPlus.instance
        .dismiss(); // Hide the loading dialog when the process is complete
  }

  Future<void> fetchDataAssetImageLoading() async {
    LoadingPlus.instance.showAssetImage(
        image: '../path/image'); // Show a loading dialog with an asset image
    await Future.delayed(
        const Duration(seconds: 3)); // Simulate a time-consuming process
    LoadingPlus.instance
        .dismiss(); // Hide the loading dialog when the process is complete
  }

  Future<void> fetchDataNetworkImageLoading() async {
    LoadingPlus.instance.showNetworkImage(
        image: 'image_url'); // Show a loading dialog with a network image
    await Future.delayed(
        const Duration(seconds: 3)); // Simulate a time-consuming process
    LoadingPlus.instance
        .dismiss(); // Hide the loading dialog when the process is complete
  }

  Future<void> fetchDataCustomLoading() async {
    LoadingPlus.instance.showCustom(
      child: const Center(
        child: Text('Loading...'),
      ),
    ); // Show a custom loading dialog with a user-defined widget
    await Future.delayed(
        const Duration(seconds: 3)); // Simulate a time-consuming process
    LoadingPlus.instance
        .dismiss(); // Hide the loading dialog when the process is complete
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingPlus.instance
                .loadingWidget(), // Show the default loading widget
            const SizedBox(height: 120.0),
            LoadingPlus.instance.loadingWidgetCustom(
                child:
                    const Text('Loading...')), // Show a custom loading widget
          ],
        ),
      ),
    );
  }
}
