
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/brand_model.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/dio_helper/endPoint.dart';
import '../../services/sp_helper/sp_helper.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context)=>BlocProvider.of(context);
  BrandModel? productModel;

  getAllProducts() {
    emit(GetProductsLoadingState());
    DioHelper.getData(
        url: EndPoint.products,
        token:
        SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value) {
      productModel=BrandModel.fromJson(value.data);
      emit(GetProductsSuccessState());
      log(jsonEncode(value.data));
      print('gggggggggggggggggggggggg');
      print(productModel?.data?.data?.original?.data?[1]);}).catchError((error){
      if(error is DioException){
        print(error.response?.data.toString());
      }
      print('eeeeeeeeeeeeeeeeeeeee$error');
      emit(GetProductsErrorState(error.toString()));
    });
  }
}
