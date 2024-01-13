// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  BuildContext context;
  TextEditingController? controller;
  TextInputType? inputType;
  bool obsecure = false;
  bool isNumber = false;
  dynamic cubit;
  String? hint;
  Widget? icon;
  int? maxlines = 1;
  Widget? passIcon;
  InputBorder? border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)));
  MyTextFormField({
    Key? key,
    required this.context,
    this.controller,
    this.inputType,
    required this.obsecure,
    required this.isNumber,
    required this.cubit,
    this.hint,
    this.icon,
    this.maxlines,
    this.passIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxlines == 1 ? 56.h : 113.h,
      child: TextFormField(
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        controller: controller,
        keyboardType: inputType,
        cursorColor: AppColors.primaryColor,
        obscureText: obsecure,
        maxLines: maxlines,
        inputFormatters:
            isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: passIcon,
          border: border,
          errorBorder: border,
          filled: true,
          fillColor: AppColors.textFormFieldColor,
          contentPadding: const EdgeInsets.all(20),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
        ),
        /*validator: (Value) {
          if (Value!.isEmpty) {
            CustomErrorWidget(
              cubit: cubit,
              errorSubject: AppStrings.registerQuestion,
            );
          } else {
            return null;
          }
          return null;
        },*/
      ),
    );
  }
}
