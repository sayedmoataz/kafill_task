import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class MyServicesWidget extends StatelessWidget {
  MyServicesWidget(
      {required this.index,
      required this.image,
      required this.title,
      required this.price,
      required this.numOfStars,
      required this.numOfCompelet,
      super.key});
  var image;
  var title;
  var price;
  var numOfStars;
  var numOfCompelet;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: 60.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: AppColors.primaryColor),
                      child: Center(
                        child: Text(" \$ $price",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 8.h),
            Text(title,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageAssets.star),
                Text('($numOfStars)',
                    style: TextStyle(
                      color: AppColors.disCountColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(width: 4.w),
                Container(
                  color: AppColors.unSelectedItem,
                  width: 10,
                  height: 0,
                ),
                SvgPicture.asset(ImageAssets.group),
                SizedBox(width: 4.w),
                Text(numOfCompelet,
                    style: TextStyle(
                      color: AppColors.completeColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
