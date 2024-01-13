import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/text_form_field.dart';

class HorizontalTextField extends StatelessWidget {
  RegisterCubit cubit;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  HorizontalTextField(
      {required this.cubit,
      required this.firstNameController,
      required this.lastNameController,
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
                  maxlines: 1,
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
