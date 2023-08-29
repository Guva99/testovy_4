import 'package:flutter/material.dart';
import 'package:testovy_zadanie4/core/theme/app_color.dart';
import 'package:testovy_zadanie4/core/theme/typography.dart';

class AppButtonStyle {
  const AppButtonStyle._();

  static final primaryStyleBlue = ElevatedButton.styleFrom(
    backgroundColor: AppColors.purpleBlue,
    foregroundColor: AppColors.white,
    textStyle: AppTypography.boldEffect.bold,
    minimumSize: const Size(double.infinity, 70),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
