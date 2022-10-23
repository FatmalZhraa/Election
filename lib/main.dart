import 'package:bloc/bloc.dart';
import 'package:electiooon/shared_preference/cache_helper.dart';
import 'package:electiooon/src/app_root.dart';

import 'package:flutter/material.dart';
import 'blocs/observer/bloc_observer.dart';
import 'dio/dio_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const AppRoot());
}


