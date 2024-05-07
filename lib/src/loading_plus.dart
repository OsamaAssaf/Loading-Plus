// Importing required libraries
library loading_plus;

import 'package:flutter/material.dart';

import 'loading_plus_controller.dart';

class LoadingPlus extends StatelessWidget {
  /// Constructor for LoadingPlus
  const LoadingPlus({
    super.key,
    required this.child,
    this.loadingWidget,
    this.backgroundColor,
    this.alignment,
    this.width,
    this.height,
  });

  /// Main screen of the app
  final Widget child;

  /// Custom loading widget, if provided
  final Widget? loadingWidget;

  /// Background color of the loading overlay
  final Color? backgroundColor;

  /// Alignment of the loading widget within the overlay
  final AlignmentGeometry? alignment;

  /// Width of the loading overlay
  final double? width;

  /// Height of the loading overlay
  final double? height;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder<bool>(
      valueListenable: LoadingPlusController().isShown,
      builder: (BuildContext context, bool value, _) {
        // Handle back button interception based on loading state
        LoadingPlusController().handleBackButtonInterceptor(value);
        return PopScope(
          // Prevent pop if loading is shown
          canPop: !value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              child, // Main content
              Visibility(
                visible: value,
                child: GestureDetector(
                  onTap: () {
                    // If barrier is not dismissible, do nothing
                    if (!LoadingPlusController().barrierDismissible) return;
                    // Dismiss loading overlay on tap
                    LoadingPlusController().dismiss();
                  },
                  child: Container(
                    // Set width to screenWidth if not provided
                    width: width ?? screenWidth,
                    // Set height to screenHeight if not provided
                    height: height ?? screenHeight,
                    // Default background color
                    color: backgroundColor ?? Colors.black38,
                    // Default alignment
                    alignment: alignment ?? Alignment.center,
                    // Use custom loading widget if provided; otherwise, use default CircularProgressIndicator
                    child: loadingWidget ??
                        CircularProgressIndicator.adaptive(
                          valueColor: LoadingPlusController().color != null
                              ? AlwaysStoppedAnimation<Color>(
                                  LoadingPlusController().color!)
                              : null, // Apply custom color if provided
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
