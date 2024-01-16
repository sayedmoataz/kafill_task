import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';
import 'package:kafill_tasl/core/utils/app_constantances.dart';
import 'package:kafill_tasl/core/utils/app_strings.dart';
import 'package:kafill_tasl/core/widgets/loadding_widget.dart';
import 'package:kafill_tasl/features/services/presentation/cubit/services_cubit.dart';
import 'package:kafill_tasl/features/services/presentation/widgets/services_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        var cubit = ServicesCubit.get(context);
        return SafeArea(
            child: Scaffold(
          body: Padding(
            padding: AppConstants.padding,
            child: (cubit.servicesModel == null) ||
                    (cubit.popularServicesModel == null)
                ? const LoaddingWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.services,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 34.h),
                      SizedBox(
                        height: 250.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: cubit.servicesModel!.data!.length,
                            itemBuilder: (context, index) => MyServicesWidget(
                                  index: index,
                                  image: cubit
                                      .servicesModel!.data![index].mainImage
                                      .toString(),
                                  title: cubit.servicesModel!.data![index].title
                                      .toString(),
                                  price: cubit.servicesModel!.data![index].price
                                      .toString(),
                                  numOfStars: cubit
                                      .servicesModel!.data![index].averageRating
                                      .toString(),
                                  numOfCompelet: cubit.servicesModel!
                                      .data![index].completedSalesCount
                                      .toString(),
                                )),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        AppStrings.popularServices,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 34.h),
                      SizedBox(
                        height: 250.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.servicesModel!.data!.length,
                            itemBuilder: (context, index) => MyServicesWidget(
                                  index: index,
                                  image: cubit.popularServicesModel!
                                      .data![index].mainImage
                                      .toString(),
                                  title: cubit
                                      .popularServicesModel!.data![index].title
                                      .toString(),
                                  price: cubit
                                      .popularServicesModel!.data![index].price
                                      .toString(),
                                  numOfStars: cubit.popularServicesModel!
                                      .data![index].averageRating
                                      .toString(),
                                  numOfCompelet: cubit.popularServicesModel!
                                      .data![index].completedSalesCount
                                      .toString(),
                                )),
                      )
                    ],
                  ),
          ),
        ));
      },
    );
  }
}
