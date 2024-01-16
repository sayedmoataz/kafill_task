import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafill_tasl/core/widgets/auth/make_login.dart';
import 'package:kafill_tasl/core/widgets/loadding_widget.dart';
import 'package:kafill_tasl/features/about/presentation/cubit/about_cubit.dart';
import 'package:kafill_tasl/features/register/presentation/widgets/text_field_container.dart';

import '../../../../core/services/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constantances.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../register/presentation/widgets/avatar_widget.dart';
import '../../../register/presentation/widgets/widget_space.dart';
import '../widgets/horizontal_text_field_disabled.dart';
import '../widgets/skills_widget.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        var cubit = AboutCubit.get(context);
        return SafeArea(
            child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Padding(
            padding: AppConstants.padding,
            child: CacheHelper.getData(key: 'token') == null
                ? const MakeLogin()
                : cubit.aboutMeModel == null
                    ? const LoaddingWidget()
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40.h),
                            Text(AppStrings.about,
                                style: TextStyle(
                                    color: Colors.grey[900], fontSize: 18.sp)),
                            SizedBox(height: 15.h),
                            Center(
                              child: Stack(
                                children: [
                                  cubit.aboutMeModel!.data!.avatar
                                          .toString()
                                          .isNotEmpty
                                      ? AvatarWidget(
                                          isNetwork: true,
                                          imagePath: cubit
                                              .aboutMeModel!.data!.avatar
                                              .toString(),
                                        )
                                      : AvatarWidget(
                                          isNetwork: false,
                                          imagePath: ImageAssets.avatar),
                                  if (cubit.aboutMeModel!.data!.avatar
                                      .toString()
                                      .isEmpty)
                                    Positioned(
                                        bottom: 0,
                                        left: 55.w,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color:
                                                      AppColors.primaryColor),
                                              child: SvgPicture.asset(
                                                  ImageAssets.addImage)),
                                        ))
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            HorizontalTextFieldDisabled(
                              cubit: cubit,
                              isEnabled: false,
                              hintFirst: cubit.aboutMeModel!.data!.firstName
                                  .toString(),
                              hintSecond:
                                  cubit.aboutMeModel!.data!.lastName.toString(),
                            ),
                            TextFieldContainer(
                              cubit: cubit,
                              labelNAme: 'Email',
                              hint: cubit.aboutMeModel!.data!.email.toString(),
                              isEnabled: false,
                              inputType: TextInputType.emailAddress,
                            ),
                            TextFieldContainer(
                              cubit: cubit,
                              labelNAme: 'Password',
                              hint: CacheHelper.getData(key: 'password'),
                              isEnabled: false,
                              obsecure: false,
                              // maxLines: 1,
                              passIcon: cubit.isShowedPassword
                                  ? IconButton(
                                      icon: const Icon(Icons.visibility),
                                      onPressed: () => cubit.showPassword(),
                                    )
                                  : IconButton(
                                      icon: const Icon(Icons.visibility_off),
                                      onPressed: () => cubit.showPassword(),
                                    ),
                              inputType: TextInputType.visiblePassword,
                            ),
                            WidgetSpaces(labelName: AppStrings.userType),
                            SizedBox(
                              height: 30.h,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Radio(
                                        value: index,
                                        groupValue: cubit
                                            .aboutMeModel!.data!.type!.code,
                                        activeColor: AppColors.primaryColor,
                                        onChanged: (value) => {},
                                      ),
                                      Text(
                                        AppStrings.accountType[index],
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.blackColor),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFieldContainer(
                              cubit: cubit,
                              labelNAme: 'About',
                              hint: cubit.aboutMeModel!.data!.about.toString(),
                              isEnabled: false,
                              obsecure: false,
                              inputType: TextInputType.text,
                            ),
                            TextFieldContainer(
                              cubit: cubit,
                              labelNAme: 'Salary',
                              hint:
                                  'SAR ${cubit.aboutMeModel!.data!.salary.toString()}',
                              isEnabled: false,
                              obsecure: false,
                              inputType: TextInputType.number,
                            ),
                            WidgetSpaces(labelName: AppStrings.birthDate),
                            Container(
                              width: double.infinity,
                              height: 56.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                  color: AppColors.textFormFieldColor,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: [
                                  Text(
                                    cubit.aboutMeModel!.data!.birthDate
                                        .toString(),
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(ImageAssets.clendar)
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                            WidgetSpaces(labelName: AppStrings.gender),
                            SizedBox(
                              height: 30.h,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: AppStrings.genderType.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Radio(
                                        value: index,
                                        activeColor: AppColors.primaryColor,
                                        groupValue:
                                            cubit.aboutMeModel!.data!.gender,
                                        onChanged: (value) {},
                                      ),
                                      Text(
                                        AppStrings.genderType[index],
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.blackColor),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16.h),
                            WidgetSpaces(labelName: AppStrings.skills),
                            const SkillWidget(),
                            SizedBox(height: 16.h),
                            WidgetSpaces(
                                labelName: AppStrings.favouriteSocialMedia),
                            ListView.builder(
                              itemCount: AppStrings.favSocialMedia.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                bool x = cubit
                                    .aboutMeModel!.data!.favoriteSocialMedia!
                                    .contains(AppStrings.favSocialMedia[index]
                                        .toString());
                                return Row(
                                  children: [
                                    Checkbox(
                                      checkColor: AppColors.whiteColor,
                                      activeColor:
                                          x ? AppColors.primaryColor : null,
                                      value: x ? true : false,
                                      onChanged: (value) {},
                                    ),
                                    SizedBox(width: 10.w),
                                    index != 2
                                        ? SvgPicture.asset(ImageAssets
                                            .favSocialMediaIcons[index])
                                        : Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SvgPicture.asset(ImageAssets.bg),
                                              SvgPicture.asset(ImageAssets
                                                  .favSocialMediaIcons[index]),
                                            ],
                                          ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      AppStrings.favSocialMedia[index],
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.blackColor),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        )),
          ),
        ));
      },
    );
  }
}
