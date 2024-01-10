import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            body: Center(
              child: Padding(
                padding: AppConstants.padding,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(AppStrings.accountLogin,
                            style: TextStyle(color: Colors.grey[900])),
                        SizedBox(height: 32.sp),
                        SvgPicture.asset(ImageAssets.loginIcon),
                        SizedBox(height: 20.sp),
                        Text(AppStrings.emailAddress,
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12.sp)),
                        SizedBox(height: 8.sp),
                        MyTextFormField(
                            context: context, obsecure: false, isNumber: false),
                        SizedBox(height: 16.sp),
                        Text(AppStrings.password,
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12.sp)),
                        SizedBox(height: 8.sp),
                        MyTextFormField(
                            context: context,
                            obsecure: true,
                            isNumber: false,
                            passIcon:
                                const Icon(Icons.remove_red_eye_outlined)),
                      ],
                    ),
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
