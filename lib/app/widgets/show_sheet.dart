import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class KWidgets {
  static void defaultDialog(
      {required BuildContext context,
      required Widget child,
      String title = '',
      TextStyle? titleStyle,
      TextAlign titleAlign = TextAlign.center,
      Color titleBgColor = KColors.primary,
      double insetPadding = 10}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(insetPadding.w),
          contentPadding:
              EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
          backgroundColor: KColors.white,
          surfaceTintColor: KColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          title: Container(
            // padding: EdgeInsets.all(10.w),
            // margin: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              // color: titleBgColor,
              // gradient: KColors.gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Text(
              title,
              textAlign: titleAlign,
              style: const TextStyle(
                color: KColors.white,
              ),
            ),
          ),
          titleTextStyle: titleStyle ??
              TextStyle(
                fontSize: KFontSize.extraLarge,
                fontWeight: KFontWeight.medium,
                color: KColors.black87,
              ),
          titlePadding: EdgeInsets.zero,
          content: SizedBox(
            width: KSizes.kScreenWidth,
            child: Wrap(
              children: [child],
            ),
          ),
        );
      },
    );
  }

  static void bottomSheet({
    required BuildContext context,
    required List<Widget> children,
    ShapeBorder? shape,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(
          children: children,
        );
      },
    );
  }
}
