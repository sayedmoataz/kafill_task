part of 'services_cubit.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class GetDependenicesState extends ServicesState {}

class GetServicesInitialState extends ServicesState {}

class GetServicesSuccessState extends ServicesState {}

class GetServicesFailedState extends ServicesState {}

class GetPopilarServicesInitialState extends ServicesState {}

class GetPopilarServicesSuccessState extends ServicesState {}

class GetPopilarServicesFailedState extends ServicesState {}
