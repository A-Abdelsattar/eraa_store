import 'package:bloc/bloc.dart';
import 'package:eraa_store/models/order_history_model.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  OrderHistoryModel? orderHistory;

  getOrderHistory() {
    emit(OrderHistoryLoading());
    DioHelper.getData(
        url: EndPoint.order_history,
        token:
            SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value) {
      emit(OrderHistorySuccess());
      orderHistory=OrderHistoryModel.fromJson(value.data);
      print(value.data);
    }).catchError((error){
      emit(OrderHistoryError());
      print(error);
    });
  }
}
