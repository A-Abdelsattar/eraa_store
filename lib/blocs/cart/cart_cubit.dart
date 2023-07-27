import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eraa_store/models/brand_model.dart';
import 'package:eraa_store/models/cart_model.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  CartModel? cartModel;
  CartModel? getCartModel;
  CartModel? checkOutModel;

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  addToCart({required int id}) {
    DioHelper.postData(
            url: EndPoint.addToCart,
            data: {'product_id': id},
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      cartModel = CartModel.fromJson(value.data);
      emit(AddToCartSuccessState());
      getCart();
      print("caart${value.data}");
    }).catchError((error) {
      print(error.toString());
      emit(AddToCartErrorState());
    });
  }

  removeFromCart({required int id}) {
    emit(RemoveFromCartLoadingState());
    DioHelper.postData(
            url: EndPoint.removeFromCart,
            data: {'cart_item_id': id},
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      getCart();
      emit(RemoveFromCartSuccessState());
      print("caart${value.data}");
    }).catchError((error) {
      print(error.toString());
      if (error is DioException) {
        print(error.response!.data);
      }
      emit(RemoveFromCartErrorState());
    });
  }

  Future<void> getCart() async{
    getCartModel = null;
    emit(GetCartLoadingState());
    final response=await DioHelper.getData(
            url: EndPoint.cart,
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token));
    print("${response.data}");
    if(response.statusCode==200){
      getCartModel = CartModel.fromJson(response.data);
      print(response.data);
      emit(GetCartSuccessState());
    }else{
      print("errrrrrrrorrrrrr:${response.data["message"].toString()}");
      emit(GetCartErrorState());
    }
  }

  upDateCart(int id, int quantity) {
    emit(UpdateCartLoadingState());
    DioHelper.postData(
            url: 'update-cart',
            data: {
              'cart_item_id': id,
              'quantity': quantity,
            },
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      print('update suc${value.data}');
      // cartModel=CartModel.fromJson(value.data);
      getCart();
      emit(UpdateCartSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data);
      }
      emit(UpdateCartErrorState());
    });
  }

  getChekOut() {
    emit(CheckOutLoadingState());
    DioHelper.getData(
            url: 'checkout',
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      checkOutModel = CartModel.fromJson(value.data);
      nameController.text = checkOutModel?.data?.user?.userName ?? '';
      addressController.text = checkOutModel?.data?.user?.address ?? '';
      phoneController.text = checkOutModel?.data?.user?.phone ?? '';
      cityController.text = checkOutModel?.data?.user?.city ?? '';
      emit(CheckOutSuccessState());
    }).catchError((error) {
      emit(CheckOutErrorState());
    });
  }

  order() {
    emit(OrderLoadingState());
    DioHelper.postData(
            url: 'place-order',
            data: {
              'name': nameController.text,
              'city': cityController.text,
              'address': addressController.text,
              'phone': phoneController.text
            },
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      emit(OrderSuccessState());
      print(value.data);
    }).catchError((error) {
      print(error);
      emit(OrderErrorState());
    });
  }
}
