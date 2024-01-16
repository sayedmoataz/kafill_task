import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:kafill_tasl/features/BottomNavigationBar/presentation/cubit/bottomnavigationbar_cubit.dart';
import 'package:kafill_tasl/features/about/presentation/cubit/about_cubit.dart';
import 'package:kafill_tasl/features/contries/presentation/cubit/contries_cubit.dart';
import 'package:kafill_tasl/features/login/presentation/cubit/login_cubit.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';
import 'package:kafill_tasl/features/services/presentation/cubit/services_cubit.dart';

final sl = GetIt.instance;

init() async {
  //! Feature
  // bloc
  sl.registerFactory(() {
    debugPrint('loginCubit.sl done');
    return LoginCubit();
  });

  sl.registerFactory(() {
    debugPrint('registerCubit.sl done');
    return RegisterCubit();
  });
  sl.registerFactory(() {
    debugPrint('AboutMe Cubit.sl done');
    return AboutCubit();
  });
  sl.registerFactory(() {
    debugPrint('Bottom Navigation Cubit.sl done');
    return BottomnavigationbarCubit();
  });
  sl.registerFactory(() {
    debugPrint('Countries Cubit.sl done');
    return ContriesCubit();
  });
  sl.registerFactory(() {
    debugPrint('Services Cubit.sl done');
    return ServicesCubit();
  });

  // // Use Cases
  // sl.registerLazySingleton(() {
  //   debugPrint('GetChat.sl done');
  //   return GetChat(chattRepository: sl());
  // });
  //
  // // Repository
  // sl.registerLazySingleton<ChatRepository>(() {
  //   debugPrint('ChatRepositoryImpl.sl done');
  //   return ChatRepositoryImpl(
  //     gptResponesRemote: sl(),
  //     networkInfo: sl(),
  //   );
  // });
  //
  // // Data Source
  // sl.registerLazySingleton<ChatRepositoryRemoteDataSource>(() {
  //   debugPrint('ChatRepositoryRemoteDataSourceImpl.sl done');
  //   return ChatRepositoryRemoteDataSourceImpl(client: sl());
  // });
  //
  // //! Core
  // sl.registerLazySingleton<NetworkInfo>(() {
  //   debugPrint('NetworkInfoImpl.sl done');
  //   return NetworkInfoImpl(internetConnectionChecker: sl());
  // });

  //! Exterinal
  sl.registerLazySingleton(() {
    debugPrint('http.sl done');
    return http.Client();
  });
}
