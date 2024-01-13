import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:kafill_tasl/features/login/presentation/cubit/login_cubit.dart';
import 'package:kafill_tasl/features/register/presentation/cubit/register_cubit.dart';

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
