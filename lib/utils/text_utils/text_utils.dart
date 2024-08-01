import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class KFontSize {
  static final double extraSmall = 8.sp;
  static final double small = 10.sp;
  static final double medium = 12.sp;
  static final double large = 14.sp;
  static final double extraLarge = 16.sp;
}

class KFontWeight {
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class KFontFamily {
  static final String? poppins = GoogleFonts.poppins().fontFamily;
}
