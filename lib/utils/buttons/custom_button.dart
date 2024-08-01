import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    this.onTap,
    this.height,
    this.width,
    this.textColor = KColors.white,
    this.color = KColors.primary,
  });
  final String name;
  final double? height;
  final double? width;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 45.h,
        width: width ,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: textColor,
              fontSize: KFontSize.medium,
            ),
          ),
        ),
      ),
    );
  }
}
