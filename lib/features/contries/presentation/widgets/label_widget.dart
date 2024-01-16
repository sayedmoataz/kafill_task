import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';

class LabelWidget extends StatelessWidget {
  LabelWidget({required this.label, super.key});
  String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.tableHeaderText),
        )
      ]),
    );
  }
}
