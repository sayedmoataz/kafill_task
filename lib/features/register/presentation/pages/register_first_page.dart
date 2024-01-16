import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/widgets/loadding_widget.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';
import 'package:kafill_tasl/features/register/presentation/widgets/text_field_container.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constantances.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/auth/auth_title.dart';
import '../../../login/presentation/widgets/error_widget.dart';
import '../widgets/horizontal_text_field.dart';
import '../widgets/stepper_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var registerEmailController = TextEditingController();
  var registerPasswordController = TextEditingController();
  var confirmRegisterPassController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    confirmRegisterPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);

        return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: AppColors.whiteColor,
                body: cubit.dependenciesModel == null
                    ? const LoaddingWidget()
                    : Padding(
                        padding: AppConstants.padding,
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Form(
                                key: registerFormKey,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 40.h),
                                      AuthAppBar(
                                          title: AppStrings.registerString, onTap: () => Navigator.pop(context)),
                                      SizedBox(height: 15.h),
                                      CustomErrorWidget(
                                          cubit: cubit,
                                          errorSubject: AppStrings
                                              .validType[cubit.validTypeIndex]),
                                      SizedBox(height: 32.h),
                                      const FirstStep(),
                                      SizedBox(height: 30.h),
                                      HorizontalTextField(
                                        cubit: cubit,
                                        initialValue: '',
                                        isEnabled: true,
                                        firstNameController:
                                            firstNameController,
                                        lastNameController: lastNameController,
                                      ),
                                      // email
                                      TextFieldContainer(
                                        cubit: cubit,
                                        controller: registerEmailController,
                                        inputType: TextInputType.emailAddress,
                                        labelNAme: AppStrings.emailAddress,
                                        maxLines: 1,
                                        passIcon: null,
                                      ),
                                      // password
                                      TextFieldContainer(
                                        cubit: cubit,
                                        controller: registerPasswordController,
                                        inputType:
                                            TextInputType.visiblePassword,
                                        labelNAme: AppStrings.registerPassword,
                                        obsecure: cubit.isShowedPassword,
                                        maxLines: 1,
                                        passIcon: cubit.isShowedPassword
                                            ? IconButton(
                                                icon: const Icon(
                                                    Icons.visibility),
                                                onPressed: () =>
                                                    cubit.showPassword(),
                                              )
                                            : IconButton(
                                                icon: const Icon(
                                                    Icons.visibility_off),
                                                onPressed: () =>
                                                    cubit.showPassword(),
                                              ),
                                      ),
                                      // confirm password
                                      TextFieldContainer(
                                        cubit: cubit,
                                        controller:
                                            confirmRegisterPassController,
                                        inputType:
                                            TextInputType.visiblePassword,
                                        labelNAme: AppStrings.confirmPassword,
                                        obsecure:
                                            cubit.isShowedConfirmsPassword,
                                        maxLines: 1,
                                        passIcon: cubit.isShowedConfirmsPassword
                                            ? IconButton(
                                                icon: const Icon(
                                                    Icons.visibility),
                                                onPressed: () =>
                                                    cubit.showConfirmPassword(),
                                              )
                                            : IconButton(
                                                icon: const Icon(
                                                    Icons.visibility_off),
                                                onPressed: () =>
                                                    cubit.showConfirmPassword(),
                                              ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(AppStrings.userType,
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12.sp)),
                                      SizedBox(height: 16.h),
                                      // type
                                      SizedBox(
                                        height: 30.h,
                                        width: double.infinity,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: cubit.dependenciesModel!
                                              .data!.types!.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Radio(
                                                  value: index,
                                                  groupValue:
                                                      cubit.selectedValue,
                                                  activeColor:
                                                      AppColors.primaryColor,
                                                  onChanged: (value) => cubit
                                                      .changeRadioSelect(index),
                                                ),
                                                Text(
                                                  cubit.dependenciesModel!.data!
                                                      .types![index].label
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 55.h),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: MaterialButton(
                                            minWidth: 140.w,
                                            height: 50.h,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            color: AppColors.buttonColor,
                                            textColor: AppColors.whiteHexColor,
                                            onPressed: () {
                                              if ((firstNameController.text.isNotEmpty) &&  (firstNameController.text.length <50) && (lastNameController.text.trim().isNotEmpty)) {
                                                debugPrint('first name valid');
                                                if ((lastNameController.text.isNotEmpty) &&(lastNameController.text.length <50) && (lastNameController.text.trim().isNotEmpty)) {
                                                  debugPrint('last name valid');
                                                  if ((registerEmailController.text.isNotEmpty) &&(AppStrings.emailRegex.hasMatch(registerEmailController.text))) {
                                                    debugPrint('email valid');
                                                    if ((registerPasswordController.text.isNotEmpty) &&(registerPasswordController.text !=registerEmailController.text) &&(registerPasswordController.text.length >8)) {
                                                      debugPrint('password valid');
                                                      if ((confirmRegisterPassController.text.isNotEmpty) &&(registerPasswordController.text ==confirmRegisterPassController.text)) {
                                                        debugPrint('confirm password valid');
                                                        cubit.isFinish = true;
                                                        cubit.isActive = true;
                                                        AppStrings.signUpData['first_name'] =firstNameController.text.toString();
                                                        AppStrings.signUpData['last_name'] =lastNameController.text.toString();
                                                        AppStrings.signUpData['email'] =registerEmailController.text.toString();
                                                        AppStrings.signUpData['password'] =registerPasswordController.text.toString();
                                                        AppStrings.signUpData['password_confirmation'] =confirmRegisterPassController.text.toString();
                                                        AppStrings.signUpData['type'] =(cubit.selectedValue +1).toString();
                                                        debugPrint(AppStrings.signUpData.toString());
                                                        Navigator.of(context).pushNamed(Routes.secondRegisterPage);
                                                      } else {
                                                        // confirm Password
                                                        cubit.validTypeIndex =4;
                                                        cubit.isErrorVisible();
                                                      }
                                                    } else {
                                                      // password
                                                      cubit.validTypeIndex = 3;
                                                      cubit.isErrorVisible();
                                                    }
                                                  } else {
                                                    // email
                                                    cubit.validTypeIndex = 2;
                                                    cubit.isErrorVisible();
                                                  }
                                                } else {
                                                  // las name
                                                  cubit.validTypeIndex = 1;
                                                  cubit.isErrorVisible();
                                                }
                                              } else {
                                                // first name
                                                cubit.validTypeIndex = 0;
                                                cubit.isErrorVisible();
                                              }
                                            },
                                            child: Text(AppStrings.next,
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    letterSpacing: 1))),
                                      )
                                    ]))))));
      },
    );
  }
}
