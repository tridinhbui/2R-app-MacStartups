import 'package:flutter/material.dart';

class AppSize {
  static const double figmaWidth = 375;
  static const double figmaHeight = 812;

  final BuildContext context;

  AppSize(this.context) : assert(context != null);

  double get height => MediaQuery.of(context).size.height;

  double get width => MediaQuery.of(context).size.width;

  bool isSmallScreen() {
    if (width < 350) {
      return true;
    } else
      return false;
  }

  double getHeight(double size) {
    return size * (height / figmaHeight);
  }

  double getWidth(double size) {
    return size * (width / figmaWidth);
  }
}