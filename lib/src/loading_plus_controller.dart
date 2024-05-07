import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class LoadingPlusController {
  LoadingPlusController._(); // Private constructor to prevent instantiation
  static final LoadingPlusController _instance =
      LoadingPlusController._(); // Singleton instance of LoadingPlusController
  factory LoadingPlusController() =>
      _instance; // Factory constructor to access the singleton instance
// Notifier for showing/hiding loading overlay
  ValueNotifier<bool> isShown = ValueNotifier<bool>(false);

  // Whether the loading overlay can be dismissed by tapping outside
  bool barrierDismissible =
      false; // Whether the back button can be intercepted while the loading overlay is shown
  bool canPop = false;

  // Color of the loading indicator
  Color? color;

  // Method to show the loading overlay
  void show({
    Color? color,
    bool barrierDismissible = false,
    bool canPop = false,
  }) {
    // Set isShown to true to display the loading overlay
    isShown.value = true;
    // Set the barrierDismissible property
    this.barrierDismissible = barrierDismissible;
    // Set the canPop property
    this.canPop = canPop;
    // Set the color property
    this.color = color;
  }

  // Method to dismiss the loading overlay
  void dismiss() {
    // Set isShown to false to hide the loading overlay
    isShown.value = false;
  }

  // Function to intercept back button presses
  bool _interceptorFunction(bool stopDefaultButtonEvent, RouteInfo routeInfo) {
    return true;
  }

  // Method to handle back button interception based on loading state
  void handleBackButtonInterceptor(bool value) {
    const String interceptorName = 'LoadingBackButton';
    if (value) {
      if (canPop) {
        // If canPop is true, return without adding interceptor
        return;
      }
      BackButtonInterceptor.add(
        _interceptorFunction, // Add the interceptor function
        name: interceptorName, // Specify the interceptor name
      );
    } else {
      BackButtonInterceptor.removeByName(
          interceptorName); // Remove the interceptor if loading is not shown
    }
  }
}
