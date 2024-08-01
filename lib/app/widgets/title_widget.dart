import 'package:flutter/material.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.fontColor = Colors.black54,
    this.isRequired = true,
  });
  final String title;
  final Color fontColor;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: KFontSize.medium,
            fontWeight: KFontWeight.bold,
            color: fontColor,
          ),
        ),
        if (isRequired)
          Text(
            ' (required)',
            style: TextStyle(
              fontSize: KFontSize.extraSmall,
              fontWeight: KFontWeight.medium,
              color: KColors.grey,
            ),
          )
      ],
    );
  }
}
