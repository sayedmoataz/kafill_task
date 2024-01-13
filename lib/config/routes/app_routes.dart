import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill_tasl/features/login/presentation/cubit/login_cubit.dart';
import 'package:kafill_tasl/features/login/presentation/pages/login_page.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';
import 'package:kafill_tasl/features/register/presentation/pages/register_first_page.dart';

import '../../core/utils/app_strings.dart';
import '../../features/register/presentation/pages/register_second_page.dart';
import '../injection_chat.dart' as di;

class Routes {
  static const String initialRoute = '/';
  static const String loginPage = '/loginRoute';
  static const String registerPage = '/registerRoute';
  static const String secondRegisterPage = '/secondRegisterRoute';
  static const String homePage = '/homeRoute';
}

class AppRoutes {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                create: (context) => di.sl<LoginCubit>(),
                child: const LoginScreen())));
      case Routes.registerPage:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<RegisterCubit>()..getDependencies(),
                  child: const RegisterScreen(),
                )));
      case Routes.secondRegisterPage:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<RegisterCubit>()..getDependencies(),
                  child: const SecondRegisterScreen(),
                )));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
                body: Center(
              child: Text(AppStrings.noRoutesFound),
            ))));
  }
}
