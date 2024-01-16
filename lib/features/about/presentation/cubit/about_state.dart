part of 'about_cubit.dart';

abstract class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

class AboutInitial extends AboutState {}

class ShowedPasswordState extends AboutState {}

class GetAboutMEIniitialState extends AboutState {}

class GetAboutMESuccessState extends AboutState {}

class GetAboutMEFailedState extends AboutState {}
