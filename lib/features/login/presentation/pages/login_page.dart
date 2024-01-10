import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';
import 'package:kafill_tasl/core/utils/app_constantances.dart';
import 'package:kafill_tasl/core/utils/app_strings.dart';
import 'package:kafill_tasl/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var formKey = GlobalKey<FormState>();
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: AppConstants.padding,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      Row(
                        children: [
                          SvgPicture.asset(ImageAssets.arrowVector),
                          SizedBox(width: 12.w),
                          Text(AppStrings.accountLogin,
                              style: TextStyle(
                                  color: Colors.grey[900], fontSize: 18.sp)),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Center(child: SvgPicture.asset(ImageAssets.loginIcon)),
                      SizedBox(height: 20.h),
                      Text(AppStrings.emailAddress,
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 12.sp)),
                      SizedBox(height: 8.h),
                      MyTextFormField(
                          context: context, obsecure: false, isNumber: false),
                      SizedBox(height: 16.sp),
                      Text(AppStrings.password,
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 12.sp)),
                      SizedBox(height: 8.h),
                      MyTextFormField(
                          context: context,
                          obsecure: true,
                          isNumber: false,
                          passIcon: const Icon(Icons.remove_red_eye_outlined)),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text('Remember me'),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: const Text('forget password?'))
                        ],
                      ),
                      SizedBox(height: 34.h),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: AppColors.buttonColor,
                            textColor: AppColors.whiteHexColor,
                            onPressed: () {},
                            child: Text(AppStrings.loginString,
                                style: TextStyle(fontSize: 18.sp))),
                      ),
                      SizedBox(height: 25.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(color: Colors.green),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Register',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
