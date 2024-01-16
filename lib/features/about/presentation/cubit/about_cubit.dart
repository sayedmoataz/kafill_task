import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill_tasl/core/services/cache_helper.dart';
import 'package:kafill_tasl/features/about/data/models/about_me_model/about_me_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/api/ens_points.dart';
part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutInitial());
  static AboutCubit get(context) => BlocProvider.of(context);

  bool isShowedPassword = true;
  void showPassword() {
    emit(AboutInitial());
    isShowedPassword = !isShowedPassword;
    emit(ShowedPasswordState());
  }

  AboutMeModel? aboutMeModel;
  Future<void> getAbout() async {
    emit(GetAboutMEIniitialState());
    var uri = Uri.parse(EndPoints.about);
    var headers = {
      'Accept-Language': 'ar',
      'Authorization': CacheHelper.getData(key: 'token').toString()
    };
    await http.get(uri, headers: headers).then((value) {
      aboutMeModel = AboutMeModel.fromJson(jsonDecode(value.body));
      debugPrint("aboutMeModel is ${value.body}");
      emit(GetAboutMESuccessState());
    }).catchError((e) {
      debugPrint("getDependencies error is $e");
      emit(GetAboutMEFailedState());
    });
  }
}
