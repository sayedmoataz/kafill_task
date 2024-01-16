import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafill_tasl/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class CustomResponseErrorWidget extends StatelessWidget {
  const CustomResponseErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Visibility(
            visible: cubit.errorResMsgVisibility,
            child: Container(
              // height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.errorContainerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    SvgPicture.asset(ImageAssets.info),
                    SizedBox(width: 4.w),
                    Text(
                      cubit.loginErrorModel == null ? '' : cubit.loginErrorModel!.message.toString(),
                      style: TextStyle(
                        color: AppColors.errorColor,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
