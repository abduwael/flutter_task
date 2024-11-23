import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  // Style
  static TextStyle get style => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      );

  static TextStyle get styleBold => style.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get styleThin => style.copyWith(
        fontWeight: FontWeight.w100,
      );

  static TextStyle get styleLight => style.copyWith(
        fontWeight: FontWeight.w300,
      );

  static TextStyle get styleRegular => style;

  // Title
  static TextStyle get title => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      );

  static TextStyle get titleBold => title.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get titleThin => title.copyWith(
        fontWeight: FontWeight.w100,
      );

  static TextStyle get titleLight => title.copyWith(
        fontWeight: FontWeight.w300,
      );

  static TextStyle get titleRegular => title;

  // Specific styles
  static TextStyle get appBar => TextStyle(
        color: AppColors.whiteColor,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get styleGrey10Shade500 => TextStyle(
        color: AppColors.greyShade500,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get styleGrey12Shade500 => TextStyle(
        color: AppColors.greyShade500,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get styleGrey16Shade900 => TextStyle(
        color: Colors.grey.shade900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get styleGrey20Shade800 => TextStyle(
        color: Colors.grey.shade800,
        fontSize: 20.sp,
        fontWeight: FontWeight.w300,
      );
}
