import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle textBold24px = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    color: ThemeColor.color1a1e25,
  );

  static TextStyle textRegular24px = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: ThemeColor.color7D7F88,
    letterSpacing: 0.02,
  );

  static TextStyle textMedium24px = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: ThemeColor.white,
  );

  static TextStyle textSemibold24px = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    color: ThemeColor.color1a1e25,
    letterSpacing: 0.013,
  );

  static TextStyle textSemibold18px = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: ThemeColor.color1a1e25,
  );

  static TextStyle textMedium16px = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: ThemeColor.color1a1e25,
  );

   static TextStyle textRegular16px = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: ThemeColor.color7D7F88,
  );

  static TextStyle textRegular13px = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    color: ThemeColor.color7D7F88,
  );

  static TextStyle caption = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
    color: ThemeColor.color1a1e25,
  );
}
