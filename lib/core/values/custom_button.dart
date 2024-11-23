import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? buttonWidget;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Function onPress;
  final Color? color;
  final String? icon;
  final TextStyle? titleStyle;
  final Color? borderColor;
  final double? fontSize;
  final bool isEnabled;
  final String? keyString;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPress,
    this.titleWidget,
    this.buttonWidget,
    this.color,
    this.width,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.height,
    this.borderRadius = 14,
    this.icon,
    this.fontSize,
    this.isEnabled = true,
    this.titleStyle,
    this.borderColor,
    this.keyString,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50.h,
      child: OutlinedButton(
        key: keyString != null ? Key(keyString!) : null,
        onPressed: isEnabled
            ? () {
                onPress();
              }
            : null,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius != null
                  ? BorderRadius.circular(borderRadius!)
                  : BorderRadius.circular(
                      14,
                    ),
            ),
          ),
          side: WidgetStateProperty.resolveWith<BorderSide>(
            (states) => BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.grayColor;
            }
            return color ?? AppColors.secondaryColor;
          }),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(
              8,
            ),
          ),
        ),
        child: buttonWidget ??
            Row(
              mainAxisAlignment:
                  icon != null ? mainAxisAlignment! : MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Image.asset(
                    icon!,
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                if (icon != null) const Gap(12),
                Flexible(
                  child: titleWidget ??
                      AutoSizeText(
                        title,
                        maxLines: 1,
                        minFontSize: 10,
                        maxFontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle ??
                            AppTextStyles.styleBold.copyWith(
                              color: Colors.white,
                            ),
                      ),
                ),
              ],
            ),
      ),
    );
  }
}
