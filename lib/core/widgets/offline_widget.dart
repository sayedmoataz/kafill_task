import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_colors.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/json/wifi_animation.json'),
          SizedBox(height: 5.h),
          Text(
            'internet connection is required',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
