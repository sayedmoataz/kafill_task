import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafill_tasl/bloc_observer.dart';
import 'package:kafill_tasl/config/injection_chat.dart' as di;
import 'package:kafill_tasl/core/services/cache_helper.dart';
import 'package:kafill_tasl/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  di.init();
  Bloc.observer = AppBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          Colors.white, // Change this color to your desired status bar color
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyAppRoot());
}
