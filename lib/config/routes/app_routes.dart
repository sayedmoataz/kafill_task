import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill_tasl/features/login/presentation/pages/login_page.dart';


import '../../core/utils/app_strings.dart';
import '../injection_chat.dart' as di;

class Routes {
  static const String initialRoute = '/';
  static const String loginPage = '/loginRoute';
  static const String registerPage = '/registerRoute';
  static const String homePage = '/homeRoute';
}

class AppRoutes {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));
      // case Routes.homePage:
      //   return MaterialPageRoute(
      //       builder: ((context) => BlocProvider(
      //             create: (context) => di.sl<HomePageCubit>()
      //               ..initSpeak()
      //               ..initSpeech(),
      //             child: const HomePage(),
      //           )));
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
