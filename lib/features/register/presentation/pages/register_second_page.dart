import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafill_tasl/core/utils/assets_manager.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';
import 'package:kafill_tasl/features/register/presentation/widgets/avatar_widget.dart';
import 'package:kafill_tasl/features/register/presentation/widgets/skills_tags.dart';
import 'package:kafill_tasl/features/register/presentation/widgets/text_field_container.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constantances.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/auth/auth_title.dart';
import '../../../../core/widgets/loadding_widget.dart';
import '../../../login/presentation/widgets/error_widget.dart';
import '../widgets/stepper_widget.dart';
import '../widgets/widget_space.dart';

class SecondRegisterScreen extends StatefulWidget {
  const SecondRegisterScreen({super.key});

  @override
  State<SecondRegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<SecondRegisterScreen> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var aboutController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: AppColors.whiteColor,
                body: cubit.dependenciesModel == null
                    ? const LoaddingWidget()
                    : Padding(
                        padding: AppConstants.padding,
                        child: SingleChildScrollView(
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            child: Form(
                                key: registerFormKey,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 40.h),
                                      AuthAppBar(
                                          title: AppStrings.registerString),
                                      SizedBox(height: 15.h),
                                      CustomErrorWidget(
                                          cubit: cubit,
                                          errorSubject: AppStrings
                                              .validType[cubit.validTypeIndex]),
                                      SizedBox(height: 32.h),
                                      const SecondStep(),
                                      SizedBox(height: 30.h),
                                      Center(
                                        child: Stack(
                                          children: [
                                            cubit.image != null
                                                ? AvatarWidget(
                                                    child: Image.file(
                                                        cubit.image!))
                                                : AvatarWidget(
                                                    child: Image.asset(
                                                        ImageAssets.avatar)),
                                            if (cubit.image == null)
                                              Positioned(
                                                  bottom: 0,
                                                  left: 55.w,
                                                  child: InkWell(
                                                    onTap: () =>
                                                        cubit.pickImage(),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color: AppColors
                                                                .primaryColor),
                                                        child: SvgPicture.asset(
                                                            ImageAssets
                                                                .addImage)),
                                                  ))
                                          ],
                                        ),
                                      ),
                                      TextFieldContainer(
                                        cubit: cubit,
                                        labelNAme: AppStrings.about,
                                        controller: aboutController,
                                        inputType: TextInputType.multiline,
                                        passIcon: null,
                                        maxLines: 5,
                                      ),
                                      WidgetSpaces(
                                          labelName: AppStrings.salary),
                                      Container(
                                        width: double.infinity,
                                        height: 56.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.textFormFieldColor,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              InkWell(
                                                  onTap: () =>
                                                      cubit.decreaseSalary(),
                                                  child: SvgPicture.asset(
                                                      ImageAssets.decrease)),
                                              const Spacer(),
                                              Text('SAR ${cubit.salary}',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16.sp)),
                                              const Spacer(),
                                              InkWell(
                                                  onTap: () =>
                                                      cubit.increaseSalary(),
                                                  child: SvgPicture.asset(
                                                      ImageAssets.increase)),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      WidgetSpaces(
                                          labelName: AppStrings.birthDate),
                                      InkWell(
                                        onTap: () => cubit.selectDate(context),
                                        child: Container(
                                          width: double.infinity,
                                          height: 56.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w),
                                          decoration: BoxDecoration(
                                              color:
                                                  AppColors.textFormFieldColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Row(
                                            children: [
                                              Text(
                                                  "${cubit.selectedDate.toLocal()}"
                                                      .split(' ')[0]),
                                              const Spacer(),
                                              SvgPicture.asset(
                                                  ImageAssets.clendar)
                                            ],
                                          ),
                                        ),
                                      ),
                                      WidgetSpaces(
                                          labelName: AppStrings.gender),
                                      SizedBox(
                                        height: 30.h,
                                        width: double.infinity,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              AppStrings.genderType.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Radio(
                                                  value: index,
                                                  activeColor:
                                                      AppColors.primaryColor,
                                                  groupValue:
                                                      cubit.selectedGender,
                                                  onChanged: (value) => cubit
                                                      .changeRadioGender(index),
                                                ),
                                                Text(
                                                  AppStrings.genderType[index],
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      WidgetSpaces(
                                          labelName: AppStrings.skills),
                                      const SkillTags(),
                                      WidgetSpaces(
                                          labelName:
                                              AppStrings.favouriteSocialMedia),
                                      ListView.builder(
                                        itemCount: cubit.dependenciesModel!
                                            .data!.socialMedia!.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Checkbox(
                                                checkColor:
                                                    AppColors.whiteColor,
                                                activeColor:
                                                    AppColors.primaryColor,
                                                value: cubit.favSocial[index],
                                                onChanged: (value) =>
                                                    cubit.selectSocialMedia(
                                                        index, value!),
                                              ),
                                              SizedBox(width: 10.w),
                                              index != 2
                                                  ? SvgPicture.asset(ImageAssets
                                                          .favSocialMediaIcons[
                                                      index])
                                                  : Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                            ImageAssets.bg),
                                                        SvgPicture.asset(ImageAssets
                                                                .favSocialMediaIcons[
                                                            index]),
                                                      ],
                                                    ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                cubit.dependenciesModel!.data!
                                                    .socialMedia![index].label
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        AppColors.blackColor),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      SizedBox(height: 34.h),
                                      cubit.isRegisterLoading
                                          ? const LoaddingWidget()
                                          : SizedBox(
                                              width: double.infinity,
                                              height: 56.h,
                                              child: MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  color: AppColors.buttonColor,
                                                  textColor:
                                                      AppColors.whiteHexColor,
                                                  onPressed: () {
                                                    if ((aboutController
                                                            .text.isNotEmpty) &&
                                                        (aboutController
                                                                .text.length >
                                                            10) &&
                                                        (aboutController
                                                                .text.length <=
                                                            1000)) {
                                                      debugPrint(
                                                          'About field valid');
                                                      if ((cubit.selectedDate
                                                                  .year ==
                                                              DateTime.now()
                                                                  .year) &&
                                                          (cubit.selectedDate
                                                                  .month ==
                                                              DateTime.now()
                                                                  .month) &&
                                                          (cubit.selectedDate
                                                                  .day <
                                                              DateTime.now()
                                                                  .day)) {
                                                        debugPrint(
                                                            'date of birth is valid');
                                                        AppStrings.signUpData[
                                                                'about'] =
                                                            aboutController.text
                                                                .toString();
                                                        AppStrings.signUpData[
                                                                'salary'] =
                                                            cubit.salary
                                                                .toString();
                                                        AppStrings.signUpData[
                                                                'birth_date'] =
                                                            cubit.datePart
                                                                .toString();
                                                        AppStrings.signUpData[
                                                                'gender'] =
                                                            cubit.selectedGender
                                                                .toString();
                                                        List.generate(
                                                            cubit
                                                                .selectedSocialMedia
                                                                .length,
                                                            (index) => AppStrings
                                                                        .signUpData[
                                                                    'favorite_social_media[$index]'] =
                                                                cubit
                                                                    .selectedSocialMedia[
                                                                        index]
                                                                    .toString());
                                                        List.generate(
                                                            cubit.selectedTags
                                                                .length,
                                                            (index) => AppStrings
                                                                        .signUpData[
                                                                    'tags[$index]'] =
                                                                cubit
                                                                    .selectedTags[
                                                                        index]
                                                                    .toString());
                                                        debugPrint(AppStrings
                                                            .signUpData
                                                            .toString());
                                                        cubit.register(context);
                                                      } else {
                                                        scrollToTop();
                                                        cubit.validTypeIndex =
                                                            8;
                                                        cubit.isErrorVisible();
                                                      }
                                                    } else {
                                                      scrollToTop();
                                                      cubit.validTypeIndex = 7;
                                                      cubit.isErrorVisible();
                                                    }
                                                  },
                                                  child: Text(AppStrings.submit,
                                                      style: TextStyle(
                                                          fontSize: 18.sp))),
                                            ),
                                    ]))))));
      },
    );
  }
}
