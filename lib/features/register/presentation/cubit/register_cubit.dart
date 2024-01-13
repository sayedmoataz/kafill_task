import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/api_headers.dart';
import '../../../../core/api/ens_points.dart';
import '../../../login/data/models/dependencies_model/dependencies_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

    DependenciesModel? dependenciesModel;
  Future<void> getDependencies() async {
    emit(GetDependenicesState());
    var uri = Uri.parse(EndPoints.dependencies);
    await http.get(uri, headers: ApiHeaders.header).then((value) {
      dependenciesModel =
          DependenciesModel.fromJson(jsonDecode(value.body));
      debugPrint("getDependencies is ${value.body}");
      emit(HomeGetDependenciesSuccessState());
    }).catchError((e) {
      debugPrint("getDependencies error is $e");

      emit( HomeGetDependenciesFailedState());
    });
  }


  bool errorMsgVisibility = false;
  void isErrorVisible() {
    emit(RegisterInitial());
    errorMsgVisibility = !errorMsgVisibility;
    emit(ShowErrorState());
    Future.delayed(const Duration(seconds: 5), () {
      errorMsgVisibility = false;
      emit(NonVisbleState());
    });
    emit(VisiblityState());
  }

  bool isActive = false;
  bool isFinish = false;

  int selectedValue = 0;

  void changeRadioSelect(int index) {
    emit(RegisterInitial());
    selectedValue = index;
    emit(RadioSelectedState());
  }

  int selectedGender = 0;

  void changeRadioGender(int index) {
    emit(RegisterInitial());
    selectedGender = index;
    emit(RadioGenderState());
  }

  bool isShowedPassword = true;
  void showPassword() {
    emit(RegisterInitial());
    isShowedPassword = !isShowedPassword;
    emit(ShowedPasswordState());
  }

  bool isShowedConfirmsPassword = true;
  void showConfirmPassword() {
    emit(RegisterInitial());
    isShowedConfirmsPassword = !isShowedConfirmsPassword;
    emit(ShowedConfirmPasswordState());
  }

  int validTypeIndex = 0;

  bool isLoadding = false;
  void loginLoading() {
    emit(RegisterInitial());
    isLoadding = !isLoadding;
    emit(LoadingState());
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);

      this.image = imageTemporary;
      emit(ImageUploadState());
    } on PlatformException catch (e) {}
  }

  int salary = 10;

  void increaseSalary() {
    emit(RegisterInitial());
    if (salary < 1000) {
      salary++;
      emit(IncreaseSalaryState());
    } else {
      validTypeIndex = 5;
      isErrorVisible();
      emit(IncreaseSalaryErrorState());
    }
  }

  void decreaseSalary() {
    emit(RegisterInitial());
    if (salary > 10) {
      salary--;
      emit(DecreaseSalaryState());
    } else {
      validTypeIndex = 6;
      isErrorVisible();
      emit(DecreaseSalaryErrorState());
    }
  }

  bool isRegisterLoading = false;
  void registerLoading() {
    emit(RegisterInitial());
    isRegisterLoading = !isRegisterLoading;
    emit(RegisterSubmitLoadingState());
  }

  List<bool> favSocial = List.generate(3, (index) => false);

  void selectSocialMedia(int index, bool value) {
    emit(RegisterInitial());
    favSocial[index] = value;
    emit(FavouirteSocialMediaState());
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    emit(RegisterInitial());
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      emit(DatePickedState());
    }
  }
}
