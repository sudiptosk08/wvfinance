import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class ToastMessage {
  static final double _padding = 8.w;
  static final double _borderWidth = 1.w;
  static final double _borderRadius = 10.r;
  static const double _opacity = 0.5;
  static const Color _colorText = KColors.secondary;
  static const int _duration = 1500;
  static const bool _shouldIconPulse = true;

  static success(String message) {
    return Get.snackbar(
      '',
      '',
      titleText: Text(
        'Success',
        style: TextStyle(
          color: KColors.black,
          fontSize: KFontSize.medium,
          fontWeight: KFontWeight.semiBold,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: KColors.black,
          fontSize: KFontSize.small,
        ),
      ),
      padding: EdgeInsets.all(_padding),
      borderWidth: _borderWidth,
      borderRadius: _borderRadius,
      borderColor: KColors.green,
      backgroundColor: KColors.white.withOpacity(_opacity),
      colorText: _colorText,
      icon: const Icon(
        Icons.done_outline_outlined,
        color: Colors.green,
      ),
      duration: const Duration(milliseconds: _duration),
      shouldIconPulse: _shouldIconPulse,
    );
  }

  static error(String message) {
    return Get.snackbar(
      '',
      '',
      titleText: Text(
        'Alert',
        style: TextStyle(
          fontSize: KFontSize.medium,
          color: KColors.black,
          fontWeight: KFontWeight.semiBold,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: KColors.black,
          fontSize: KFontSize.small,
        ),
      ),
      padding: EdgeInsets.all(_padding),
      borderWidth: _borderWidth,
      borderRadius: _borderRadius,
      borderColor: KColors.red,
      backgroundColor: KColors.white.withOpacity(_opacity),
      colorText: _colorText,
      icon: const Icon(
        Icons.error_outlined,
        color: Colors.red,
      ),
      duration: const Duration(milliseconds: _duration),
      shouldIconPulse: _shouldIconPulse,
    );
  }
}
