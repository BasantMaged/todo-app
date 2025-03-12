// ignore: file_names
import 'package:flutter/material.dart';
import 'package:update_to_do_app/core/utils/app_color.dart';

abstract class AppTextStyle {
  static TextStyle welcomePage({Color color = AppColors.textPrimary}) =>
      TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.w400);

  static TextStyle bodyText({Color color = AppColors.textSecondary}) =>
      TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle nameTextField({
    required double fontSize,
    // ignore: non_constant_identifier_names
    required Color Color,
  }) => TextStyle(
    color: AppColors.textSecondary,
    fontSize: fontSize,
    fontWeight: FontWeight.w200,
  );
  static TextStyle titleText({Color color = AppColors.whiteText}) =>
      TextStyle(color: color, fontSize: 19, fontWeight: FontWeight.w300);
}
