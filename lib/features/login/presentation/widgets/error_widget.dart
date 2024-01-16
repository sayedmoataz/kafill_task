import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {required this.cubit, required this.errorSubject, super.key});
  final cubit;
  final String errorSubject;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: cubit.errorMsgVisibility,
        child: Container(
          // height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.errorContainerColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                SvgPicture.asset(ImageAssets.info),
                SizedBox(width: 4.w),
                Text(
                  errorSubject,
                  style: TextStyle(
                    color: AppColors.errorColor,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
