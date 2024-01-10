import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme(){
  return ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(

      titleMedium: TextStyle( 
        fontFamily: 'Montserrat',
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,

      )
    ),
  );
}
