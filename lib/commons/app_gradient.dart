import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradient {
  static final linearGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
     colors: [AppColors.gradientStart, AppColors.gradientEnd], //Flutter bug
  );
}
