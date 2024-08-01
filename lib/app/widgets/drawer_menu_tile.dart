import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class DrawerMenuTile extends StatelessWidget {
  const DrawerMenuTile({
    super.key,
    this.title,
    this.iconData,
    this.menuTitle,
    this.onTap,
    this.menuTitleColor = Colors.grey,
    this.trailing,
  });

  final String? title;
  final IconData? iconData;
  final String? menuTitle;
  final VoidCallback? onTap;
  final Color menuTitleColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: iconData != null
          ? Icon(
              iconData,
              color: KColors.primary,
              size: 18.sp,
            )
          : menuTitle != null
              ? Text(
                  menuTitle!,
                  style: TextStyle(
                    letterSpacing: 2.w,
                    fontSize: KFontSize.small,
                    color: menuTitleColor,
                  ),
                )
              : Container(
                  width: 10.w,
                ),
      title: menuTitle == null
          ? Text(
              title!,
              style: TextStyle(
                fontSize: KFontSize.medium,
              ),
            )
          : null,
      trailing: trailing,
    );
  }
}
