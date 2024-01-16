part of 'contries_cubit.dart';

abstract class ContriesState extends Equatable {
  const ContriesState();

  @override
  List<Object> get props => [];
}

class ContriesInitial extends ContriesState {}
class GetCountriesInitialState extends ContriesState {}
class GetCountriesSuccessState extends ContriesState {}
class GetCountriesFailedState extends ContriesState {}