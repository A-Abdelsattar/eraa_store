import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eraa_store/models/brand_model.dart';
import 'package:eraa_store/models/product_model.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../services/sp_helper/sp_helper.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit() : super(BrandInitial());

  static BrandCubit get(context) => BlocProvider.of(context);
  BrandModel? brandModel;
  ProductModel? productsOfBrand;
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  getAllBrands() {
    emit(GetAllBrandsLoadingState());
    DioHelper.getData(
            url: EndPoint.brands,
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      brandModel = BrandModel.fromJson(value.data);
      print(value.data);
      emit(GetAllBrandsSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data.toString());
      }
    });
  }

  getProductsOfBrand(int id) {
    emit(GetProductsOfBrandLoadingState());
    DioHelper.getData(url: '${EndPoint.productsOfBrand}/$id')
        .then((value) {
          productsOfBrand=ProductModel.fromJson(value.data);
          emit(GetProductsOfBrandSuccessState());
    })
        .catchError((error) {
          emit(GetProductsOfBrandErrorState(error));
    });
  }
}
