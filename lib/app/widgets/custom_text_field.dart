import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.height,
    super.key,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.borderRadius,
    this.readOnly = false,
    this.maxLines,
    this.filled = false,
    this.fillColor = KColors.gray,
    this.focusedBorder,
    this.enabledBorder,
    this.cursorColor,
    this.suffixIcon,
    this.keyboardType,
    this.maxLength,
    this.isDismissKeyboardOutsideTap = true,
    this.controller,
    this.onTap,
    this.onChanged,
    this.inputFormatters,
    this.prefix,
  });

  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final Color fillColor;
  final double? height;
  final TextStyle? hintStyle;
  final String? hintText;
  final int? maxLines;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool filled;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool isDismissKeyboardOutsideTap;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      child: TextFormField(
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
        onTapOutside: isDismissKeyboardOutsideTap
            ? (event) => FocusScope.of(context).unfocus()
            : null,
        readOnly: readOnly,
        cursorColor: cursorColor,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: KFontSize.medium,
          fontWeight: KFontWeight.bold,
          // color: KColors.primary,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefix: prefix,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          filled: filled,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 11.sp,
                color: Colors.grey,
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                borderSide: const BorderSide(
                  color: KColors.gray,
                ),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                borderSide: const BorderSide(
                  color: KColors.gray,
                ),
              ),
        ),
      ),
    );
  }
}
