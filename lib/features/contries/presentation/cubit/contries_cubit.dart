import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contries_state.dart';

class ContriesCubit extends Cubit<ContriesState> {
  ContriesCubit() : super(ContriesInitial());
}
