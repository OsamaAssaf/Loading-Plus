import 'package:flutter/material.dart';

class LoadingPlusWidget extends StatelessWidget {
  const LoadingPlusWidget({
    super.key,
    this.color,
    this.customLoadingWidget,
  }); // Constructor for LoadingPlusWidget

  final Color? color; // Color of the CircularProgressIndicator
  final Widget? customLoadingWidget; // Custom loading widget, if provided

  @override
  Widget build(BuildContext context) {
    return customLoadingWidget ?? // If customLoadingWidget is provided, use it; otherwise, use default CircularProgressIndicator
        Center(
          child: CircularProgressIndicator.adaptive(
            valueColor: color != null
                ? AlwaysStoppedAnimation<Color>(color!)
                : null, // Apply custom color if provided
          ),
        );
  }
}
