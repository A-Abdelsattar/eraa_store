import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/src/app_root.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init();
  DioHelper.init();
  runApp(const AppRoot());
}
