import 'package:bloc/bloc.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/src/app_root.dart';
import 'package:flutter/material.dart';

import 'bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init();
  DioHelper.init();
  Bloc.observer=MyBlocObserver();
  runApp(const AppRoot());
}
