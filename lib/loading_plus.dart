library loading_plus;

import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingPlus {
  LoadingPlus._();

  static final LoadingPlus _instance = LoadingPlus._();

  static LoadingPlus get instance => _instance;

  GlobalKey<NavigatorState>? _key;

  void init(GlobalKey<NavigatorState> navigatorKey) {
    _key = navigatorKey;
  }

  void show({
    Color? color,
    bool barrierDismissible = false,
    bool willPopScope = false,
    ImageFilter? backdropFilter,
  }) {
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.show()');
    }
    backdropFilter = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => willPopScope,
          child: BackdropFilter(
            filter: backdropFilter!,
            child: Center(
              child: CircularProgressIndicator(
                color: color,
              ),
            ),
          ),
        );
      },
    );
  }

  void showAssetImage({
    required String image,
    double width = 24.0,
    double height = 24.0,
    bool barrierDismissible = false,
    bool willPopScope = false,
    ImageFilter? backdropFilter,
  }) {
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.showAssetImage()');
    }
    backdropFilter = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => willPopScope,
          child: BackdropFilter(
            filter: backdropFilter!,
            child: Center(
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

  void showNetworkImage({
    required String image,
    double width = 24.0,
    double height = 24.0,
    bool barrierDismissible = false,
    bool willPopScope = false,
    ImageFilter? backdropFilter,
  }) {
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.showNetworkImage()');
    }
    backdropFilter = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => willPopScope,
          child: BackdropFilter(
            filter: backdropFilter!,
            child: Center(
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

  void showCustom({
    required Widget child,
    bool barrierDismissible = false,
    bool willPopScope = false,
  }) {
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.showCustom()');
    }
    showDialog(
      context: _key!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => willPopScope,
          child: child,
        );
      },
    );
  }

  void dismiss() {
    if (_key == null) {
      throw Exception(
          'You must use LoadingPlus.loadingInit(navigatorKey) before calling LoadingPlus.dismiss()');
    }
    Navigator.of(_key!.currentContext!).pop();
  }

  Center loadingWidget({
    Color? color,
  }) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }

  Center loadingWidgetCustom({
    required Widget child,
  }) {
    return Center(
      child: child,
    );
  }
}
