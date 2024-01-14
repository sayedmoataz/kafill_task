import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kafill_tasl/config/routes/app_routes.dart';
import 'package:kafill_tasl/core/api/ens_points.dart';
import 'package:kafill_tasl/core/services/cache_helper.dart';
import 'package:kafill_tasl/features/login/data/models/login_error_model/login_error_model.dart';
import 'package:kafill_tasl/features/login/data/models/login_success_model/login_success_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool rememberChecked = false;
  void checkCheckbox() {
    emit(CheckboxUncheckedState());
    rememberChecked = !rememberChecked;
    emit(CheckboxCheckedState());
  }

  bool isShowedPassword = true;
  void showPassword() {
    emit(LoginInitial());
    isShowedPassword = !isShowedPassword;
    emit(ShowedPasswordState());
  }

  bool errorMsgVisibility = false;
  void isErrorVisible() {
    emit(LoginInitial());
    errorMsgVisibility = !errorMsgVisibility;
    emit(ShowErrorState());
    Future.delayed(const Duration(seconds: 5), () {
      errorMsgVisibility = false;
      emit(NonVisbleState());
    });
    emit(VisiblityState());
  }

  bool isLoginLoading = false;
  bool isLoginValidation = false;
  void loginLoading() {
    emit(LoginInitial());
    isLoginLoading = !isLoginLoading;
    emit(LoginLoadingState());
  }

  LoginSuccessModel? loginSuccessModel;
  LoginErrorModel? loginErrorModel;
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    loginLoading();
    await http.post(Uri.parse(EndPoints.login), body: {
      'email': email,
      'password': password
    }, headers: {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
      // 'Content-Type': 'multipart/form-data',
      // 'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      // 'Authorization': 'Bearer ${CacheHelper.putData(key: 'token',value: token)}',
    }).then((value) {
      loginSuccessModel = LoginSuccessModel.fromJson(jsonDecode(value.body));
      if (rememberChecked == true) {
        CacheHelper.putData(
            key: 'token', value: loginSuccessModel!.accessToken.toString());
      }
      debugPrint('loginSuccessModel is : ${value.body}');
      Navigator.pushNamed(context, Routes.loginPage);
      loginLoading();
    }).catchError((e) {
      // loginErrorModel = LoginErrorModel.fromJson(jsonDecode(e));
      debugPrint('login error is : $e');
      loginLoading();
      emit(HomeLoginErrorState());
    });
  }
}
