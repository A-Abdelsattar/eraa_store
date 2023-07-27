import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/favorite_model.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context)=>BlocProvider.of(context);

  FavoriteModel? favoriteModel;
  FavoriteModel? getFavorite;
  List<dynamic> ids=[];

  addToFavorite({required int id}){
    DioHelper.postData(url: EndPoint.addToWishList, data: {
      'product_id':id,
    },
    token: SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value) {
      favoriteModel=FavoriteModel.fromJson(value.data);
      getFavoriteProducts();
      emit(AddToFavoriteSuccessState());
    }).catchError((error){
      print(error.toString());
      if(error is DioException){
        print(error.response!.data);
      }
      emit(AddToFavoriteErrorState());
    });
  }

  removeFromFavorite({required int id}){
    DioHelper.postData(url: EndPoint.removeFromWishlist, data: {
      'product_id':id,
    },
        token: SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value) {
      getFavoriteProducts();
      emit(RemoveFromFavoriteSuccessState());
    }).catchError((error){
      print(error.toString());
      if(error is DioException){
        print(error.response!.data.toString());}
      emit(RemoveFromFavoriteErrorState());
    });
  }

  Map<String, dynamic> favMap ={};
  getFavoriteProducts(){
    emit(GetFavoriteItemsLoading());
    DioHelper.getData(url: EndPoint.getFavoriteProducts,token: SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token)).then((value){
      getFavorite=FavoriteModel.fromJson(value.data);
      print("faaaaaaav${value.data}");
       ids = value.data['data'].map((item) => item['id']).toList();
      value.data['data'].map((item) => favMap.addAll({'${item['id']}' : 'true'}));

      emit(GetFavoriteItemsSuccess());
    }
    ).catchError((error){
      print(error);
      emit(GetFavoriteItemsError());
    });
  }

}
