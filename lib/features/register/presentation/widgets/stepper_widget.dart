import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';
import 'package:kafill_tasl/features/register/presentation/widgets/active_line_color.dart';
import 'package:kafill_tasl/features/register/presentation/widgets/dis_active_line_color.dart';

/*class CustomStepper extends StatelessWidget {
  CustomStepper({required this.cubit, super.key});
  RegisterCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LineActiveColor(),
        cubit.isFinish
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.stepperActiveColor,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.stepperActiveColor,
                  child: Center(
                    child: Icon(
                      Icons.done,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ))
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.stepperActiveColor,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  child: Text(
                    '1',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.stepperActiveColor),
                  ),
                )),
        cubit.isFinish ? const LineActiveColor() : const LineDisActiveColor(),
        !cubit.isActive
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.stepperDisActiveColor,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.stepperDisActiveColor,
                    child: null))
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.stepperActiveColor,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  child: Text(
                    '2',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.stepperActiveColor),
                  ),
                )),
        const LineDisActiveColor(),
      ],
    );
  }
}

*/
class FirstStep extends StatelessWidget {
  const FirstStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LineActiveColor(),
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.stepperActiveColor,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child: Text(
                '1',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.stepperActiveColor),
              ),
            )),
        const LineDisActiveColor(),
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.stepperDisActiveColor,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.stepperDisActiveColor,
                child: null)),
        const LineDisActiveColor(),
      ],
    );
  }
}

class SecondStep extends StatelessWidget {
  const SecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LineActiveColor(),
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.stepperActiveColor,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.stepperActiveColor,
              child: Center(
                child: Icon(
                  Icons.done,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
            )),
        const LineActiveColor(),
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.stepperActiveColor,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child: Text(
                '2',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.stepperActiveColor),
              ),
            )),
        const LineDisActiveColor(),
      ],
    );
  }
}
