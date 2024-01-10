import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill_tasl/core/utils/app_colors.dart';
import 'package:kafill_tasl/features/login/presentation/pages/login_page.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'core/widgets/offline_widget.dart';
import 'features/login/presentation/cubit/login_cubit.dart';

import 'package:kafill_tasl/config/injection_chat.dart' as di;

class MyAppRoot extends StatelessWidget {
  const MyAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            color: AppColors.primaryColor,
            initialRoute: '/',
            onGenerateRoute: AppRoutes.onGeneratedRoute,
            home: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected) {
                  return BlocProvider(create: (context) => di.sl<LoginCubit>(),child: const LoginScreen());
                } else {
                  return const OfflineWidget();
                }
              },
              child: const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.secondaryColor)),
            ),
          );
        });
  }
}
