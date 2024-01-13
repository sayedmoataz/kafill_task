part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class CheckboxCheckedState extends LoginState {}

class CheckboxUncheckedState extends LoginState {}

class ShowedPasswordState extends LoginState {}

class VisiblityState extends LoginState {}

class ShowErrorState extends LoginState {}

class NonVisbleState extends LoginState {}

class LoginLoadingState extends LoginState {}

class HomeLoginErrorState extends LoginState {}

class GetDependenicesState extends LoginState {}
class HomeGetDependenciesSuccessState extends LoginState {}
class HomeGetDependenciesFailedState extends LoginState {}
