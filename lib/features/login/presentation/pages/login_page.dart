import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';
import 'package:kafill_tasl/core/utils/app_constantances.dart';
import 'package:kafill_tasl/core/utils/app_strings.dart';
import 'package:kafill_tasl/core/widgets/auth/auth_title.dart';
import 'package:kafill_tasl/features/login/presentation/cubit/login_cubit.dart';
import 'package:kafill_tasl/features/login/presentation/widgets/error_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/loadding_widget.dart';
import '../../../../core/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);

        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
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
                      AuthAppBar(title: AppStrings.accountLogin),
                      SizedBox(height: 15.h),
                      cubit.isLoginValidation
                          ? CustomErrorWidget(
                              cubit: cubit,
                              errorSubject: AppStrings.requiredFields)
                          : CustomErrorWidget(
                              cubit: cubit,
                              errorSubject: AppStrings.forgetPasswordError),
                      SizedBox(height: 32.h),
                      Center(child: SvgPicture.asset(ImageAssets.loginIcon)),
                      SizedBox(height: 20.h),
                      Text(AppStrings.emailAddress,
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 12.sp)),
                      SizedBox(height: 8.h),
                      MyTextFormField(
                          controller: emailcontroller,
                          context: context,
                          obsecure: false,
                          maxlines: 1,
                          cubit: cubit,
                          isNumber: false),
                      SizedBox(height: 16.sp),
                      Text(AppStrings.password,
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 12.sp)),
                      SizedBox(height: 8.h),
                      MyTextFormField(
                          controller: passwordcontroller,
                          context: context,
                          cubit: cubit,
                          obsecure: cubit.isShowedPassword,
                          isNumber: false,
                          maxlines: 1,
                          passIcon: cubit.isShowedPassword
                              ? IconButton(
                                  icon: const Icon(Icons.visibility),
                                  onPressed: () => cubit.showPassword(),
                                )
                              : IconButton(
                                  icon: const Icon(Icons.visibility_off),
                                  onPressed: () => cubit.showPassword(),
                                )),
                      Row(
                        children: [
                          Checkbox(
                            value: cubit.rememberChecked,
                            onChanged: (_) => cubit.checkCheckbox(),
                            activeColor: AppColors.primaryColor,
                          ),
                          Text(AppStrings.rememberMe,
                              style: AppConstants.rememberMeStyle),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                cubit.isLoginValidation = false;
                                cubit.isErrorVisible();
                              },
                              child: Text(AppStrings.forgetPassword,
                                  style: AppConstants.rememberMeStyle))
                        ],
                      ),
                      SizedBox(height: 34.h),
                      cubit.isLoginLoading
                          ? const LoaddingWidget()
                          : SizedBox(
                              width: double.infinity,
                              child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: AppColors.buttonColor,
                                  textColor: AppColors.whiteHexColor,
                                  onPressed: () {
                                    if ((emailcontroller.text.isNotEmpty) &&
                                        (passwordcontroller.text.isNotEmpty)) {
                                      cubit
                                          .login(
                                              context: context,
                                              email: emailcontroller.text
                                                  .toString(),
                                              password: passwordcontroller.text
                                                  .toString())
                                          .then((value) {
                                        emailcontroller.clear();
                                        passwordcontroller.clear();
                                      });
                                    } else {
                                      cubit.isLoginValidation = true;
                                      cubit.isErrorVisible();
                                    }
                                  },
                                  child: Text(AppStrings.loginString,
                                      style: TextStyle(fontSize: 18.sp))),
                            ),
                      SizedBox(height: 20.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: AppStrings.registerQuestion,
                            style: AppConstants.rememberMeStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: AppStrings.register,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed(
                                      Routes.registerPage,
                                    );
                                  },
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
