import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kafill_tasl/bloc_observer.dart';
import 'package:kafill_tasl/core/services/cache_helper.dart';
import 'package:kafill_tasl/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyAppRoot());
}

