import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {super.key,
      this.hint,
      this.keyboardType,
      required this.controller,
      this.obscureText = false,
      this.suffixIcon,
      this.padding = 12,
      this.radius = 12,
      this.onValidate,
      this.height,
      this.width,
      this.rtl = true,
      this.phoneField = false,
      this.readOnly,
      this.label});

  final String? hint;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final double padding;
  final double radius;
  final double? width;
  final double? height;
  final String? label;
  final bool rtl;
  final bool phoneField;
  final bool? readOnly;

  final Function? onValidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 45.h,
      decoration: const BoxDecoration(
        color: KColors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
        readOnly: readOnly ?? false,
        style: TextStyle(
            fontSize: KFontSize.medium, fontFamily: KFontFamily.poppins),
        decoration: InputDecoration(
          label: rtl
              ? null
              : Text(
                  label.toString(),
                  style: TextStyle(
                      fontFamily: KFontFamily.poppins,
                      fontSize: KFontSize.medium),
                ),
          suffixIcon: suffixIcon,
          alignLabelWithHint: true,
          hintText: hint,
          hintTextDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          hintStyle: TextStyle(
              fontSize: KFontSize.small, fontFamily: KFontFamily.poppins),
          enabledBorder: rtl
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: phoneField
                      ? const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5))
                      : const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                  borderSide: const BorderSide(
                    color: KColors.borderColor,
                    width: 1.0,
                  ),
                ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          focusedBorder: rtl
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: phoneField
                      ? const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5))
                      : const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                  borderSide: const BorderSide(
                    color: KColors.primary,
                    width: 1.0,
                  ),
                ),
        ),
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
