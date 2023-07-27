import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eraa_store/models/brand_model.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  BrandModel? categoryModel;
  ProductModel? productsOfCategory;

  getAllCategories() {
    emit(GetAllCategoriesLoadingState());
    DioHelper.getData(
        url: EndPoint.categories,
        token:
            SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value) {
      categoryModel=BrandModel.fromJson(value.data);
      emit(GetAllCategoriesSuccessState());

    }).catchError((error){
      if(error is DioException){
        print(error.response?.data.toString());
      }
      emit(GetAllCategoriesErrorState(error));
    });
  }

  getProductsOfCategory(int id) {
    emit(GetProductsOfCategoryLoadingState());
    DioHelper.getData(url: '${EndPoint.productsOfCategory}/$id')
        .then((value) {
      productsOfCategory=ProductModel.fromJson(value.data);
      emit(GetProductsOfCategorySuccessState());
    })
        .catchError((error) {
      emit(GetProductsOfCategoryErrorState());
    });
  }


}
