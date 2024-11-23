import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_styles.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {this.hint,
      required this.textEditingController,
      this.label,
      this.minLines,
      this.isEnabled = true,
      this.isPassword = false,
      this.validator,
      this.suffixIcon,
      this.isObscure = true,
      this.changeObscure,
      this.prefixIcon,
      this.onChanged,
      this.textInputType,
      this.height,
      this.isMandatory = false,
      this.maxLength = null,
      this.readOnly = false,
      Key? key,
      this.submited,
      this.bottomPadding = 0,
      this.isName = false,
      this.borderWithFilled = false,
      this.onTap,
      this.maxHeightSuffix,
      this.withMaxLine = true,
      this.textEditingScrollController,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.maxLine,
      this.changeColorReadOnly = false,
      this.fillColor})
      : super(key: key);

  final String? hint;
  final bool? changeColorReadOnly;
  final int? minLines;
  final String? label;
  final GestureTapCallback? onTap;
  final String? prefixIcon;
  final void Function(String)? onChanged;
  final TextEditingController textEditingController;
  final ScrollController? textEditingScrollController;
  final Color? fillColor;
  final TextInputType? textInputType;
  final bool isEnabled;
  final String? Function(String?)? submited;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool isObscure;
  final VoidCallback? changeObscure;
  final bool isPassword;
  final AutovalidateMode autoValidateMode;
  final bool readOnly;
  final bool isMandatory;
  final bool withMaxLine;
  final double? height;
  final double? maxHeightSuffix;

  final int? maxLength;
  final int? maxLine;

  final double bottomPadding;
  final bool isName;
  final bool borderWithFilled;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          (context as Element).markNeedsBuild();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: submited == null ? bottomPadding : 0,
        ),
        child: Builder(
          builder: (BuildContext context) {
            return Semantics(
              label: label ?? "input",
              child: TextFormField(
                minLines: minLines,
                cursorColor: AppColors.primaryColor,
                autovalidateMode: autoValidateMode,
                readOnly: readOnly,
                scrollController: textEditingScrollController,
                onTap: onTap,
                onFieldSubmitted: submited ?? (v) {},
                key: Key(label ?? "label"),
                controller: textEditingController,
                keyboardType: textInputType,
                enabled: isEnabled,
                obscureText: !isPassword ? !isObscure : isObscure,
                style: AppTextStyles.title.copyWith(
                  color: readOnly == true && changeColorReadOnly == false
                      ? AppColors.greyShade600
                      : AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                maxLength: !withMaxLine ? null : maxLength,
                maxLines: !withMaxLine ? null : maxLine ?? 1,
                decoration: InputDecoration(
                  label: Text(
                    hint ?? "",
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.popularGrey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  filled: fillColor != null,
                  fillColor: AppColors.whiteColor,
                  counterText: "",
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: fillColor ?? AppColors.whiteColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.secondaryColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.secondaryColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 11.sp,
                  ),
                  errorMaxLines: 2,
                  hintText: hint,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
                  hintStyle: AppTextStyles.title.copyWith(
                    color: AppColors.popularGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0.w,
                    ),
                    child: suffixIcon ??
                        (!isPassword
                            ? null
                            : GestureDetector(
                                onTap: () {
                                  changeObscure!();
                                },
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isObscure ? 8 : 12,
                                    ),
                                    child: isObscure
                                        ? const Icon(
                                            Icons.remove_red_eye_outlined)
                                        : const Icon(Icons
                                            .remove_red_eye) // color: Colors.black,

                                    ),
                              )),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: maxHeightSuffix?.h ?? 18.h,
                    maxWidth: 50.w,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 18.h,
                    maxWidth: 50.w,
                  ),
                  // prefixIcon: prefixIcon == null
                  //     ? null
                  //     : Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 16,
                  //         ),
                  //         child: SvgPicture.asset(
                  //           prefixIcon!,
                  //           fit: BoxFit.scaleDown,
                  //           colorFilter: const ColorFilter.mode(
                  //             AppColors.greyShade600,
                  //             BlendMode.srcIn,
                  //           ),
                  //         ),
                  //       ),
                ),
                validator: validator,
                onChanged: (value) {
                  if (onChanged != null) onChanged!(value);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
