import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eraa_store/models/profile_model.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_keys.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  File? fileImage;
  var response;

  getUserData() {
    emit(GetUserDataLoadingState());
    DioHelper.getData(
            url: EndPoint.profile,
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emailController.text = profileModel?.data?.email ?? '';
      nameController.text = profileModel?.data?.name ?? '';
      addressController.text = profileModel?.data?.address ?? '';
      phoneController.text = profileModel?.data?.phone ?? '';
      print(value.data);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data);
      }
      emit(GetUserDataErrorState());
      print(error);
    });
  }

  updateUserData() async{
    emit(UpdateUserDataLoadingState());
    DioHelper.postData(
        url: EndPoint.updateProfile,
        token: SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token),
        data:
        FormData.fromMap({
          'name': nameController.text,
          'email': emailController.text,
          'address': addressController.text,
          // 'city': city,
          // 'phone': phone,
          'image':fileImage==null?null:await MultipartFile.fromFile(fileImage?.path??''),
        }),
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      getUserData();
      emit(UpdateUserDataSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
      }
      print(error);
      emit(UpdateUserDataErrorState());
    });
  }




  Future uploadOnlyImage() async {
    emit(UploadLoadingState1());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["jpg", "png", "jpeg"],
      type: FileType.custom,

    );
    fileImage = File(result?.files.single.path ?? "");
    print(result!.files.single.path);
    print("---------- uplod is done ------------");
    emit(UploadSuccessState1());
  }
}
