import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill_tasl/features/about/presentation/cubit/about_cubit.dart';
import 'package:kafill_tasl/features/about/presentation/pages/about_me.dart';
import 'package:kafill_tasl/features/services/presentation/cubit/services_cubit.dart';

import '../../../../config/injection_chat.dart' as di;
import '../../../contries/presentation/cubit/contries_cubit.dart';
import '../../../contries/presentation/pages/countries.dart';
import '../../../services/presentation/pages/services.dart';

part 'bottomnavigationbar_state.dart';

class BottomnavigationbarCubit extends Cubit<BottomnavigationbarState> {
  BottomnavigationbarCubit() : super(BottomnavigationbarInitial());

  static BottomnavigationbarCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 2;

  void changeIndex(index) {
    emit(BottomnavigationbarInitial());
    selectedIndex = index;
    emit(BottomnavigationbarChangeState());
  }

  List widgetOptions = [
    BlocProvider(
      create: (context) => di.sl<AboutCubit>()..getAbout(),
      child: const AboutMe(),
    ),
    BlocProvider(
      create: (context) => di.sl<ContriesCubit>()..getCountries(1),
      child: const Countries(),
    ),
    BlocProvider(
      create: (context) => di.sl<ServicesCubit>()
        ..getServices()
        ..getPopularServices(),
      child: const ServicesScreen(),
    ),
  ];
}
