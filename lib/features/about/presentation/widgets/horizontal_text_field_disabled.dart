// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/text_form_field.dart';

class HorizontalTextFieldDisabled extends StatelessWidget {
  var cubit;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  bool isEnabled;
  String hintFirst;
  String hintSecond;
  HorizontalTextFieldDisabled(
      {required this.cubit,
      this.firstNameController,
      this.lastNameController,
      required this.isEnabled,
      required this.hintFirst,
      required this.hintSecond,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.firstName,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.sp)),
              SizedBox(height: 8.h),
              MyTextFormField(
                  controller: firstNameController,
                  inputType: TextInputType.name,
                  context: context,
                  isEnabled: false,
                  maxlines: 1,
                  hint: hintFirst,
                  obsecure: false,
                  isNumber: false,
                  cubit: cubit),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.lastName,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.sp)),
              SizedBox(height: 8.h),
              MyTextFormField(
                  controller: lastNameController,
                  inputType: TextInputType.name,
                  context: context,
                  obsecure: false,
                  isEnabled: false,
                  hint: hintSecond,
                  maxlines: 1,
                  isNumber: false,
                  cubit: cubit),
            ],
          ),
        ),
      ],
    );
  }
}
