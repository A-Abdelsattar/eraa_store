import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eraa_store/core/toast/toast.dart';
import 'package:eraa_store/enums/toast_state.dart';
import 'package:eraa_store/models/auth_model.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context)=>BlocProvider.of(context);

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordConfirmationController=TextEditingController();

  AuthModel? authModel;

  register(){
    emit(RegisterLoadingState());
    DioHelper.postData(url: EndPoint.register, data:{
      'name':nameController.text,
      'email':emailController.text,
      'password':passwordController.text,
      'password_confirmation':passwordConfirmationController.text,
    } ).then((value){
      authModel=AuthModel.fromJson(value.data);
      SharedPreferenceHelper.saveData(key: SharedPreferencesKeys.token, value: authModel!.data!.token);
      emit(RegisterSuccessState());
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      passwordConfirmationController.clear();

    }).catchError((error){
      print(error.toString());
      if(error is DioException){
        print(error.response?.data.toString());
        ToastConfig.showToast(msg: 'Error${error.response?.data['errors'].toString()}', toastStates: ToastStates.error);
      }
      emit(RegisterErrorState(error));
    });
  }


  login(){
    emit(LoginLoadingState());
    DioHelper.postData(url: EndPoint.login, data:{
      'email':emailController.text,
      'password':passwordController.text,
    } ).then((value){
      authModel=AuthModel.fromJson(value.data);
      SharedPreferenceHelper.saveData(key: SharedPreferencesKeys.token, value: authModel!.data!.token);
      emit(LoginSuccessState());
      emailController.clear();
      passwordController.clear();

    }).catchError((error){
      print(error.toString());
      if(error is DioException){
        print(error.response?.data.toString());
        ToastConfig.showToast(msg: 'Error${error.response?.data['errors'].toString()}', toastStates: ToastStates.error);
      }
      emit(LoginErrorState(error));
    });
  }

}
