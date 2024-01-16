import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';
import 'package:kafill_tasl/core/utils/app_constantances.dart';
import 'package:kafill_tasl/core/widgets/loadding_widget.dart';
import 'package:kafill_tasl/features/contries/presentation/cubit/contries_cubit.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../../core/utils/app_strings.dart';
import '../widgets/label_widget.dart';

class Countries extends StatelessWidget {
  const Countries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContriesCubit, ContriesState>(
      builder: (context, state) {
        var cubit = ContriesCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: cubit.countriesModel == null
                ? const LoaddingWidget()
                : Padding(
                    padding: AppConstants.padding,
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: 40.h),
                            Text(AppStrings.countries,
                                style: TextStyle(
                                    color: Colors.grey[900], fontSize: 18.sp)),
                            SizedBox(height: 15.h),
                            Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                    dividerThickness: 2,
                                    // dataRowHeight: 40.h,
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                      (states) {
                                        return AppColors.unSelectedItem;
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    columns: [
                                      DataColumn(
                                        label: LabelWidget(label: 'Contry'),
                                      ),
                                      DataColumn(
                                        label: LabelWidget(label: 'Capotal'),
                                      ),
                                    ],
                                    rows: List.generate(
                                        cubit.countriesModel!.data!.length,
                                        (index) => DataRow(cells: [
                                              DataCell(Center(
                                                  child: Text(
                                                cubit.countriesModel!
                                                    .data![index].name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              ))),
                                              DataCell(Center(
                                                  child: Text(cubit
                                                      .countriesModel!
                                                      .data![0]
                                                      .capital
                                                      .toString())))
                                            ]))),
                              ),
                            ),
                            NumberPagination(
                              onPageChanged: (int pageNumber) {
                                log('pageNumber is : $pageNumber');
                                cubit.getCountries(pageNumber);
                              },
                              pageTotal: cubit
                                  .countriesModel!.pagination!.totalPages!
                                  .toInt(),
                              fontSize: 12.sp,
                              threshold: 3,
                            ),
                          ],
                        )),
                  ),
          ),
        );
      },
    );
  }
}
