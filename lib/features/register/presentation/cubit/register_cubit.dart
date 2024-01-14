import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:kafill_tasl/config/routes/app_routes.dart';
import 'package:kafill_tasl/core/utils/assets_manager.dart';
import 'package:kafill_tasl/features/login/data/models/dependencies_model/tag.dart';
import 'package:kafill_tasl/features/register/data/models/register_success_model.dart';

import '../../../../core/api/api_headers.dart';
import '../../../../core/api/ens_points.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../login/data/models/dependencies_model/dependencies_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  DependenciesModel? dependenciesModel;
  List<Tag>? tags = [];
  List<bool>? selectedTag;
  Future<void> getDependencies() async {
    emit(GetDependenicesState());
    var uri = Uri.parse(EndPoints.dependencies);
    await http.get(uri, headers: ApiHeaders.header).then((value) {
      dependenciesModel = DependenciesModel.fromJson(jsonDecode(value.body));
      tags = dependenciesModel!.data!.tags;
      selectedTag = List.generate(tags!.length, (index) => false);
      debugPrint("getDependencies is ${value.body}");
      emit(HomeGetDependenciesSuccessState());
    }).catchError((e) {
      debugPrint("getDependencies error is $e");

      emit(HomeGetDependenciesFailedState());
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

      debugPrint(image.toString());
      debugPrint(image.path.toString());
      emit(ImageUploadState());
    } on PlatformException catch (e) {}
  }

  int salary = 100;

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
    if (salary > 100) {
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
  List<String> selectedSocialMedia = [];
  void selectSocialMedia(int index, bool value) {
    emit(RegisterInitial());
    favSocial[index] = value;
    selectedSocialMedia
        .add(dependenciesModel!.data!.socialMedia![index].value.toString());
    emit(FavouirteSocialMediaState());
  }

  void selecttags(int index, bool value) {
    emit(RegisterInitial());
    selectedTag![index] = value;
    emit(SelectTagsState());
  }

  DateTime selectedDate = DateTime.now();
  String datePart = '';

  Future<void> selectDate(BuildContext context) async {
    emit(RegisterInitial());
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      List<String> parts = selectedDate.toString().split(' ');
      datePart = parts[0];
      emit(DatePickedState());
    }
  }

  List<String> selectedTags = [];
  List<String> selectedTagsValues = [];

  void changeSelectedState(index, value) {
    emit(RegisterInitial());
    selectedTags.add(tags![index].value.toString());

    selectedTagsValues.add(tags![index].label.toString());
    selecttags(index, value!);
    emit(SelectedTagState());
  }

  void removeTag(int index) {
    emit(RegisterInitial());
    selectedTag![index] = false;
    selectedTagsValues.remove(selectedTagsValues[index]);
    selectedTags.remove(selectedTags[index]);
    emit(RemoveTagState());
  }

  RegisterSuccessModel? registerSuccessModel;
  Future<void> register(context) async {
    emit(RegisterInitialState());
    var uri = Uri.parse(EndPoints.register);

    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll(AppStrings.signUpData);
    request.files.add(await http.MultipartFile.fromPath(
        'avatar',
        image?.lengthSync() == 0
            ? ImageAssets.avatar
            : image!.path.toString()));
    request.headers.addAll(ApiHeaders.header);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      debugPrint('register Success');
      Navigator.pushNamed(context, Routes.loginPage);
      emit(RegisterSuccessState());
    } else {
      debugPrint(response.reasonPhrase);
      debugPrint(response.statusCode.toString());
      debugPrint(response.stream.toString());
      debugPrint(await response.stream.bytesToString());
      emit(RegisterFailedState());
    }
  }
}
