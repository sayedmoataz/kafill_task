part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class NonVisbleState extends RegisterState {}

class VisiblityState extends RegisterState {}

class ShowErrorState extends RegisterState {}

class ShowedPasswordState extends RegisterState {}

class ShowedConfirmPasswordState extends RegisterState {}

class RadioSelectedState extends RegisterState {}

class RadioGenderState extends RegisterState {}

class LoadingState extends RegisterState {}

class ImageUploadState extends RegisterState {}

class IncreaseSalaryState extends RegisterState {}

class IncreaseSalaryErrorState extends RegisterState {}

class DecreaseSalaryState extends RegisterState {}

class DecreaseSalaryErrorState extends RegisterState {}

class RegisterSubmitLoadingState extends RegisterState {}

class FavouirteSocialMediaState extends RegisterState {}

class DatePickedState extends RegisterState {}

class GetDependenicesState extends RegisterState {}

class HomeGetDependenciesSuccessState extends RegisterState {}

class HomeGetDependenciesFailedState extends RegisterState {}

class SelectTagsState extends RegisterState {}

class SelectedTagState extends RegisterState {}

class RemoveTagState extends RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailedState extends RegisterState {}
