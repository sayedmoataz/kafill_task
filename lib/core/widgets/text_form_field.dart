// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  BuildContext context;
  TextEditingController? controller;
  TextInputType? inputType;
  bool obsecure = false;
  bool isNumber = false;
  String? hint;
  Widget? icon;
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
    this.hint,
    this.icon,
    this.passIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      controller: controller,
      keyboardType: inputType,
      obscureText: obsecure,
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        suffixIcon: passIcon,
        border: border,
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade400)),
      ),
      validator: (Value) {
        if (Value!.isEmpty) {
          return '$hint Must Not be Empty';
        } else {
          return null;
        }
      },
    );
  }
}
