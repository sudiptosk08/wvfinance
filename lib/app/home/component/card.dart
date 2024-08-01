import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final bool bold;
  final bool boolIcon;
  final VoidCallback onTap;
  const HomeCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.bold,
    required this.onTap,
    required this.boolIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 160.h,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: KColors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boolIcon
                ? Icon(
                    icon,
                    color: KColors.primary,
                    size: 35,
                  )
                : Text(
                    "৳",
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: KColors.primary,
                        height: 0.8,
                        fontWeight: FontWeight.bold),
                  ),
            SizedBox(
              height: KSizes.vGapSmall,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: KFontSize.large,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: bold ? KFontSize.large : KFontSize.small,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
