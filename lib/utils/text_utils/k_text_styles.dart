import 'package:flutter/material.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class KTextStyles {
  static TextStyle appbarTitle = TextStyle(
    fontSize: KFontSize.large,
    color: KColors.white,
    fontWeight: KFontWeight.bold,
    fontFamily: KFontFamily.poppins,
  );
  static TextStyle title = TextStyle(
    fontSize: KFontSize.extraLarge,
    fontWeight: KFontWeight.bold,
  );

  static TextStyle textFieldLabel = TextStyle(
    fontSize: KFontSize.medium,
    fontWeight: FontWeight.bold,
  );
}
