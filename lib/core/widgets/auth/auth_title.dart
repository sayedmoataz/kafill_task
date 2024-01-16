// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/assets_manager.dart';

class AuthAppBar extends StatelessWidget {
  String title;
  Function() onTap;
  AuthAppBar({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(onTap: onTap, child: SvgPicture.asset(ImageAssets.arrowVector)),
        SizedBox(width: 12.w),
        Text(title, style: TextStyle(color: Colors.grey[900], fontSize: 18.sp)),
      ],
    );
  }
}
