import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafill_tasl/config/routes/app_routes.dart';
import 'package:kafill_tasl/core/utils/app_constantances.dart';
import 'package:kafill_tasl/core/utils/assets_manager.dart';

import '../../utils/app_colors.dart';

class MakeLogin extends StatelessWidget {
  const MakeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: AppConstants.padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.logot),
              const Text('Please Login First'),
              MaterialButton(
                minWidth: 140.w,
                height: 50.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: AppColors.buttonColor,
                textColor: AppColors.whiteHexColor,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginPage);
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
