import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';
import 'package:kafill_tasl/core/utils/app_strings.dart';
import 'package:kafill_tasl/core/utils/assets_manager.dart';
import 'package:kafill_tasl/features/BottomNavigationBar/presentation/cubit/bottomnavigationbar_cubit.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationbarCubit, BottomnavigationbarState>(
      builder: (context, state) {
        var cubit = BottomnavigationbarCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: cubit.widgetOptions[cubit.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                currentIndex: cubit.selectedIndex,
                selectedItemColor: AppColors.primaryColor,
                showUnselectedLabels: true,
                backgroundColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.unSelectedItem,
                iconSize: 40,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                elevation: 5,
                items: [
                  BottomNavigationBarItem(
                    icon: cubit.selectedIndex == 0
                        ? SvgPicture.asset(ImageAssets.selectedItem[0])
                        : SvgPicture.asset(ImageAssets.nonSelectedItem[0]),
                    label: AppStrings.selectedItemLable[0],
                  ),
                  BottomNavigationBarItem(
                    icon: cubit.selectedIndex == 1
                        ? SvgPicture.asset(ImageAssets.selectedItem[1])
                        : SvgPicture.asset(ImageAssets.nonSelectedItem[1]),
                    label: AppStrings.selectedItemLable[1],
                  ),
                  BottomNavigationBarItem(
                    icon: cubit.selectedIndex == 2
                        ? SvgPicture.asset(ImageAssets.selectedItem[2])
                        : SvgPicture.asset(ImageAssets.nonSelectedItem[2]),
                    label: AppStrings.selectedItemLable[2],
                  )
                ]),
          ),
        );
      },
    );
  }
}
