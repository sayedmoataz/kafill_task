import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kafill_tasl/features/services/data/models/popular_services/popular_services.dart';
import 'package:kafill_tasl/features/services/data/models/services/services.dart';

import '../../../../core/api/ens_points.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  static ServicesCubit get(context) => BlocProvider.of(context);

  ServicesModel? servicesModel;
  Future<void> getServices() async {
    emit(GetServicesInitialState());
    var uri = Uri.parse(EndPoints.services);
    var headers = {'Accept-Language': 'ar'};
    await http.get(uri, headers: headers).then((value) {
      servicesModel = ServicesModel.fromJson(jsonDecode(value.body));
      debugPrint("getServices is ${value.body}");
      emit(GetServicesSuccessState());
    }).catchError((e) {
      debugPrint("getServices error is $e");
      emit(GetServicesFailedState());
    });
  }

  PopularServicesModel? popularServicesModel;
  Future<void> getPopularServices() async {
    emit(GetPopilarServicesInitialState());
    var uri = Uri.parse(EndPoints.popularServices);
    var headers = {'Accept-Language': 'ar'};
    await http.get(uri, headers: headers).then((value) {
      popularServicesModel =
          PopularServicesModel.fromJson(jsonDecode(value.body));
      debugPrint("getPopularServices is ${value.body}");
      emit(GetPopilarServicesSuccessState());
    }).catchError((e) {
      debugPrint("getPopularServices error is $e");
      emit(GetPopilarServicesFailedState());
    });
  }
}
