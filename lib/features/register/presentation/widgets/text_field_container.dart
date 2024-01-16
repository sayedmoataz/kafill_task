import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/text_form_field.dart';

class TextFieldContainer extends StatelessWidget {
  var cubit;
  String labelNAme;
  TextEditingController? controller;
  TextInputType? inputType;
  Widget? passIcon;
  int? maxLines = 1;
  bool? obsecure = false;
  bool? isEnabled = true;
  String? hint = '';
  TextFieldContainer(
      {required this.cubit,
      required this.labelNAme,
      this.controller,
      this.inputType,
      this.maxLines,
      this.passIcon,
      this.obsecure,
      this.isEnabled,
      this.hint,
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
          isEnabled: isEnabled,
          hint: hint,
          obsecure: obsecure ?? false,
          cubit: cubit,
          maxlines: maxLines,
          isNumber: false,
        ),
      ],
    );
  }
}
