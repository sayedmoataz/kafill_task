import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafill_tasl/core/utils/assets_manager.dart';
import 'package:kafill_tasl/core/utils/media_query_values.dart';
import 'package:kafill_tasl/core/widgets/loadding_widget.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';

import '../../../../core/utils/app_colors.dart';

class SkillTags extends StatefulWidget {
  const SkillTags({super.key});

  @override
  State<SkillTags> createState() => _SkillTagsState();
}

class _SkillTagsState extends State<SkillTags> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return SingleChildScrollView(
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Dialog(
                        backgroundColor: AppColors.whiteHexColor,
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: cubit.tags!.isEmpty
                                ? const LoaddingWidget()
                                : Column(
                                    children: [
                                      const Spacer(),
                                      SizedBox(
                                        height: context.height * .5,
                                        child: ListView.builder(
                                            itemCount: cubit.tags!.length,
                                            itemBuilder: (innerContext,
                                                    index) =>
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                        checkColor: AppColors
                                                            .whiteColor,
                                                        activeColor: AppColors
                                                            .primaryColor,
                                                        value:
                                                            cubit.selectedTag![
                                                                index],
                                                        onChanged: (value) {
                                                          cubit
                                                              .changeSelectedState(
                                                                  index, value);
                                                          setState(() {});
                                                        }),
                                                    Text(cubit
                                                        .tags![index].label
                                                        .toString()),
                                                  ],
                                                )),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          MaterialButton(
                                              color: AppColors.buttonColor,
                                              textColor:
                                                  AppColors.whiteHexColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: const Text('Ok'),
                                              onPressed: () =>
                                                  Navigator.pop(context)),
                                        ],
                                      ),
                                    ],
                                  )));
                  });
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: cubit.selectedTagsValues.isEmpty ? 94.h : null,
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
                      cubit.selectedTagsValues.length,
                      (index) => InkWell(
                            onTap: () {
                              cubit.removeTag(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.selectedTagColor),
                              width: 120.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                        cubit.selectedTagsValues[index]
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
          ),
        );
      },
    );
  }
}
