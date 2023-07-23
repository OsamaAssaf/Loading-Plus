# Loading Plus

Loading Plus is a Flutter package that simplifies the process of adding loading dialogs and loading widgets to your Flutter applications. Loading indicators are essential UI components that enhance user experience by indicating ongoing processes or data retrieval.

## Features

- **Easy Integration**: Loading Plus offers a straightforward integration process. With just a few lines of code, developers can quickly add loading indicators to their apps without the need for extensive manual setup.

- **Customizable Loading Dialogs**: The package provides pre-designed loading dialogs that can be easily customized to match the app's theme and branding. Developers can adjust the appearance, color, size, and animation of the loading dialogs to create a seamless user experience.

- **Multiple Loading Widgets**: Loading Plus offers a variety of loading widgets, each with its unique animation style. This variety allows developers to choose the loading indicator that best fits their application's context, enhancing visual appeal and usability.

- **Flexibility and Control**: The package offers developers the flexibility to control when and where loading indicators appear. They can easily trigger loading dialogs during data fetches, API calls, or any other asynchronous processes, ensuring users stay informed about ongoing actions.

- **Smooth Animations**: Loading Plus ensures that loading animations are smooth and responsive, providing users with a visually pleasing experience while they wait for content or processes to load.

- **Documentation and Examples**: To assist developers in using the package effectively, comprehensive documentation and examples are provided. This helps reduce the learning curve and enables developers to implement the loading indicators with ease.

## Getting Started

Follow these simple steps to get started with Loading Plus:

1. **Installation**: Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  loading_plus: ^1.0.0
```

2. **Initialize the Package**: In your `main.dart` file, create a global key for the NavigatorState and initialize the Loading Plus package with it:

```dart
import 'package:flutter/material.dart';
import 'package:loading_plus/loading_plus.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  LoadingPlus.instance.init(navigatorKey);
  runApp(const MyApp());
}
```

3. **Usage**: Now you can use the Loading Plus package to show loading dialogs and loading widgets anywhere in your app. For example:

```dart
// Show a default loading dialog
LoadingPlus.instance.show();

// Show a custom loading dialog
LoadingPlus.instance.showCustom(
  child: const Center(
    child: Text('Loading...'),
  ),
);

// Show a loading dialog with an asset image
LoadingPlus.instance.showAssetImage(image: 'assets/loading.gif');

// Show a loading dialog with a network image
LoadingPlus.instance.showNetworkImage(image: 'https://example.com/loading.gif');

// Dismiss the loading dialog when the process is complete
LoadingPlus.instance.dismiss();

// Show a default loading widget
LoadingPlus.instance.loadingWidget();

// Show a custom loading widget
LoadingPlus.instance.loadingWidgetCustom(
  child: const Text('Loading...'),
);
```

## Example

For a complete example of how to use Loading Plus, check out the `example/` folder in the repository.

## Contribution

Contributions to Loading Plus are welcome! If you encounter any issues, have suggestions, or want to improve the package, please feel free to create a pull request or submit an issue on the [GitHub repository](https://github.com/yourusername/loading_plus).

## License

Loading Plus is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

This package is created to simplify the process of adding loading indicators to Flutter applications and provide developers with a reliable and customizable solution.

## Credits

This package is created and maintained by [Your Name](https://github.com/yourusername).

```

Make sure to replace `[yourusername]` with your GitHub username and update other relevant sections to match the specifics of your package. The README provides detailed instructions on how to get started with the package, its features, usage examples, and contribution guidelines.
