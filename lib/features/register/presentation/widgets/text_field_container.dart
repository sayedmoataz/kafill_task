import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';

import '../../../../core/widgets/text_form_field.dart';

class TextFieldContainer extends StatelessWidget {
  RegisterCubit cubit;
  String labelNAme;
  TextEditingController controller;
  TextInputType inputType;
  Widget? passIcon;
  int? maxLines = 1;
  bool? obsecure = false;
  TextFieldContainer(
      {required this.cubit,
      required this.labelNAme,
      required this.controller,
      required this.inputType,
      this.maxLines,
      required this.passIcon,
      this.obsecure,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(labelNAme,
            style: TextStyle(color: Colors.grey[500], fontSize: 12.sp)),
        SizedBox(height: 8.h),
        MyTextFormField(
            controller: controller,
            inputType: inputType,
            passIcon: passIcon,
            context: context,
            obsecure: obsecure ?? false,
            cubit: cubit,
            maxlines: maxLines,
            isNumber: false),
      ],
    );
  }
}
