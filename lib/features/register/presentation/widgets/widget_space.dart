import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetSpaces extends StatelessWidget {
  String labelName;
  WidgetSpaces({required this.labelName, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(labelName,
            style: TextStyle(color: Colors.grey[500], fontSize: 12.sp)),
        SizedBox(height: 5.h),
      ],
    );
  }
}
