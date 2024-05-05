// Importing required libraries
library loading_plus;

import 'dart:ui';

import 'package:flutter/material.dart';

// Defining the LoadingPlus class
class LoadingPlus {
  // Private constructor to prevent external instantiation
  LoadingPlus._();

  // Singleton instance of the LoadingPlus class
  static final LoadingPlus _instance = LoadingPlus._();

  // Getter to access the singleton instance
  static LoadingPlus get instance => _instance;

  // Global key to keep track of the navigator state
  GlobalKey<NavigatorState>? _key;

  // Initialization method to set the navigator key
  void init(GlobalKey<NavigatorState> navigatorKey) {
    _key = navigatorKey;
  }

  // Method to show a default loading dialog with a CircularProgressIndicator
  void show({
    Color? color,
    bool barrierDismissible = false,
    @Deprecated('willPopScope is deprecated use canPop instead') bool willPopScope = false,
    bool canPop = false,
    ImageFilter? backdropFilter,
  }) {
    // Check if the navigator key is set
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.show()');
    }
    // Set a default backdrop filter with zero blur
    backdropFilter = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
    // Show the loading dialog
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        // Wrap the dialog in a WillPopScope to handle back button presses
        return PopScope(
          canPop: canPop,
          child: BackdropFilter(
            filter: backdropFilter!,
            child: Center(
              // Show a CircularProgressIndicator in the center of the dialog
              child: CircularProgressIndicator(
                color: color,
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to show a loading dialog with an asset image in the center
  void showAssetImage({
    required String image,
    double width = 24.0,
    double height = 24.0,
    bool barrierDismissible = false,
    @Deprecated('willPopScope is deprecated use canPop instead') bool willPopScope = false,
    bool canPop = false,
    ImageFilter? backdropFilter,
  }) {
    // Check if the navigator key is set
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.showAssetImage()');
    }
    // Set a default backdrop filter with zero blur
    backdropFilter = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
    // Show the loading dialog
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        // Wrap the dialog in a WillPopScope to handle back button presses
        return PopScope(
          canPop: canPop,
          child: BackdropFilter(
            filter: backdropFilter!,
            child: Center(
              // Show an Image.asset widget with the specified asset image in the center
              child: Image.asset(
                image,
                width: width,
                height: height,
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to show a loading dialog with a network image in the center
  void showNetworkImage({
    required String image,
    double width = 24.0,
    double height = 24.0,
    bool barrierDismissible = false,
    @Deprecated('willPopScope is deprecated use canPop instead') bool willPopScope = false,
    bool canPop = false,
    ImageFilter? backdropFilter,
  }) {
    // Check if the navigator key is set
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.showNetworkImage()');
    }
    // Set a default backdrop filter with zero blur
    backdropFilter = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
    // Show the loading dialog
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        // Wrap the dialog in a WillPopScope to handle back button presses
        return PopScope(
          canPop: canPop,
          child: BackdropFilter(
            filter: backdropFilter!,
            child: Center(
              // Show an Image.network widget with the specified network image in the center
              child: Image.network(
                image,
                width: width,
                height: height,
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to show a custom loading dialog with a custom child widget
  void showCustom({
    required Widget child,
    bool barrierDismissible = false,
    @Deprecated('willPopScope is deprecated use canPop instead') bool willPopScope = false,
    bool canPop = false,
  }) {
    // Check if the navigator key is set
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.showCustom()');
    }
    // Show the loading dialog
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        // Wrap the dialog in a WillPopScope to handle back button presses
        return PopScope(
          canPop: canPop,
          child: child,
        );
      },
    );
  }

  // Method to dismiss the currently displayed loading dialog
  void dismiss() {
    // Check if the navigator key is set
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.dismiss()');
    }
    // Dismiss the loading dialog
    Navigator.of(_key!.currentContext!).pop();
  }

  // Utility method to create a default loading widget with a CircularProgressIndicator
  Center loadingWidget({
    Color? color,
  }) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }

  // Utility method to create a custom loading widget with a provided child widget
  Center loadingWidgetCustom({
    required Widget child,
  }) {
    return Center(
      child: child,
    );
  }
}
