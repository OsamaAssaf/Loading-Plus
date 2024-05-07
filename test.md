# Loading Plus

Loading Plus is a Flutter package that simplifies the process of adding loading overlays and loading widgets to your Flutter applications. Loading indicators are essential UI components that enhance user experience by indicating ongoing processes or data retrieval.

## Features

- **Easy Integration**: Loading Plus offers a straightforward integration process. With just a few lines of code, developers can quickly add loading indicators to their apps without the need for extensive manual setup.

- **Customizable Loading**: The package provides pre-designed loading overlays that can be easily customized to match the app's theme and branding. Developers can adjust the appearance, color, size, and animation of the loading overlays to create a seamless user experience.

- **Flexibility and Control**: The package offers developers the flexibility to control when and where loading indicators appear. They can easily trigger loading overlays during data fetches, API calls, or any other asynchronous processes, ensuring users stay informed about ongoing actions.

- **Smooth Animations**: Loading Plus ensures that loading animations are smooth and responsive, providing users with a visually pleasing experience while they wait for content or processes to load.
 
- **Prevent Back Button**: Prevent back button presses while the loading overlay is shown.

- **Documentation and Examples**: To assist developers in using the package effectively, comprehensive documentation and examples are provided. This helps reduce the learning curve and enables developers to implement the loading indicators with ease.

## Getting Started

Follow these simple steps to get started with Loading Plus:

1. **Installation**: Add the following:

To use Loading Plus, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  loading_plus: ^2.0.0
```

Then, import the package in your Dart code:

```dart
import 'package:loading_plus/loading_plus.dart';
```

2. **Initialize**: To use the loading overlay, wrap your main widget with LoadingPlus and provide the main content as a child:

Default Loading Overlay
```dart
LoadingPlus(
  child: YourMainWidget(),
)
```

Custom Loading Overlay Widget
```dart
LoadingPlus(
  child: YourMainWidget(),
  loadingWidget: YourCustomLoadingWidget(),
)
```

3**Usage**: Now you can use the Loading Plus package to show loading overlays and loading widgets anywhere in your app. For example:

```dart
// Show the loading overlay
  LoadingPlusController().show();

// Dismiss the loading overlay
  LoadingPlusController().dismiss();

// Use default loading widget
  LoadingPlusWidget()

// Use custom loading widget
    LoadingPlusWidget(
      child: Center(
          child: Text('Loading...'),
        ),
    );
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:loading_plus/loading_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Loading Plus Demo',
      home: LoadingPlus(
        child: YourMainWidget(),
      ),
    );
  }
}
```

For a complete example of how to use Loading Plus, check out the [example](example) folder in the repository.

## Contribution

Contributions to Loading Plus are welcome! If you encounter any issues, have suggestions, or want to improve the package, please feel free to create a pull request or submit an issue on the [GitHub repository](https://github.com/OsamaAssaf/loading_plus).

## License

Loading Plus is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

This package is created to simplify the process of adding loading indicators to Flutter applications and provide developers with a reliable and customizable solution.

## Credits

This package is created and maintained by [Osama Assaf](https://github.com/OsamaAssaf).
