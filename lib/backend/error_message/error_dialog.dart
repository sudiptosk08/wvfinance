import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/utils/color/kcolors.dart';

class ErrorDialog {
  static message({
    required title,
    required message,
    statusCode,
    required barrierDismissible,
  }) {
    Get.defaultDialog(
      title: '',
      barrierDismissible: barrierDismissible,
      radius: 5,
      titlePadding: const EdgeInsets.all(0),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      content: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: KColors.background,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              color: KColors.background,
            ),
          ),
          SizedBox(height: 15.h),
          if (statusCode != null)
            Text(
              'HTTP: $statusCode',
              style: TextStyle(
                fontSize: 12.sp,
                color: KColors.background.withOpacity(0.45),
              ),
            ),
          // SizedBox(
          //   height: 25.h,
          // ),
        ],
      ),
    );
  }
}
