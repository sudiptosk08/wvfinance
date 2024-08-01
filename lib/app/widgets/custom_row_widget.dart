import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({
    super.key,
    required this.title,
    required this.ontap,
    this.iconData,
    this.prefixWidget,
  });
  final String title;
  final VoidCallback ontap;
  final IconData? iconData;
  final Widget? prefixWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  size: 18.sp,
                  color: KColors.primary,
                ),
              SizedBox(
                width: KSizes.hGapMedium,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: KFontSize.medium,
                  fontWeight: KFontWeight.bold,
                  color: KColors.primary,
                ),
              ),
            ],
          ),
          prefixWidget ??
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15.sp,
                  color: KColors.primary,
                ),
              ),
        ],
      ),
    );
  }
}
