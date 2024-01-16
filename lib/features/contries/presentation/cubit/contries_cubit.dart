import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kafill_tasl/features/contries/data/models/countries_model/countries_model.dart';

import '../../../../core/api/ens_points.dart';

part 'contries_state.dart';

class ContriesCubit extends Cubit<ContriesState> {
  ContriesCubit() : super(ContriesInitial());

  static ContriesCubit get(context) => BlocProvider.of(context);

  CountriesModel? countriesModel;
  Future<void> getCountries(pageNumber) async {
    emit(GetCountriesInitialState());
    var uri = Uri.parse('${EndPoints.countries}$pageNumber');
    var headers = {'Accept-Language': 'ar'};
    await http.get(uri, headers: headers).then((value) {
      countriesModel = null;
      countriesModel = CountriesModel.fromJson(jsonDecode(value.body));
      debugPrint("getCountries is ${value.body}");

      emit(GetCountriesSuccessState());
    }).catchError((e) {
      debugPrint("getCountries error is $e");
      emit(GetCountriesFailedState());
    });
  }
}
