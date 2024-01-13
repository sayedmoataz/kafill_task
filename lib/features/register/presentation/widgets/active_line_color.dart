import 'package:flutter/material.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';

class LineActiveColor extends StatelessWidget {
  const LineActiveColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          height: 2.0,
          color: AppColors.stepperActiveColor),
    );
  }
}
