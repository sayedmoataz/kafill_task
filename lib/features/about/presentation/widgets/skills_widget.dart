import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafill_tasl/core/utils/assets_manager.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/about_cubit.dart';

class SkillWidget extends StatefulWidget {
  const SkillWidget({super.key});

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        var cubit = AboutCubit.get(context);
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: cubit.aboutMeModel!.data!.tags!.isEmpty ? 94.h : null,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: AppColors.textFormFieldColor,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                    cubit.aboutMeModel!.data!.tags!.length,
                    (index) => InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.selectedTagColor),
                            width: 120.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                      cubit
                                          .aboutMeModel!.data!.tags![index].name
                                          .toString(),
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.primaryColor)),
                                ),
                                SvgPicture.asset(ImageAssets.cancelIcon)
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ),
        );
      },
    );
  }
}
