import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class LineDisActiveColor extends StatelessWidget {
  const LineDisActiveColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          height: 2.0,
          color: AppColors.stepperDisActiveColor),
    );
  }
}
