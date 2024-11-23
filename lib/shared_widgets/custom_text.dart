import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final int? maxLine;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overflow;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final String semanticsLabel;
  const CustomText({
    super.key,
    required this.text,
    this.textStyle,
    this.maxLine,
    this.fontWeight = FontWeight.w300,
    this.color = Colors.black,
    this.fontSize = 22,
    this.overflow,
    this.height,
    this.textAlign = TextAlign.start,
    this.textDecoration,
    this.fontFamily,
    this.semanticsLabel = '',
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      semanticsLabel: semanticsLabel,
      overflow: overflow,
      style: textStyle ??
          TextStyle(
            fontFamily: fontFamily,
            decoration: textDecoration,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            height: height,
            decorationColor: color,
            decorationThickness: 1.5,
          ),
    );
  }
}
