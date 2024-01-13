import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    textTheme: TextTheme(
        titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    )),
  );
}
