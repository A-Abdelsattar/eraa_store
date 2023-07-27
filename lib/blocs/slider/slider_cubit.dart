import 'package:bloc/bloc.dart';
import 'package:eraa_store/models/slider_model.dart';
import 'package:eraa_store/services/dio_helper/dio_helper.dart';
import 'package:eraa_store/services/dio_helper/endPoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

 static SliderCubit get(context)=>BlocProvider.of(context);
  SliderModel? sliderModel;

  getSlider(){
    emit(SliderLoadingState());
    DioHelper.getData(url: EndPoint.sliders).then((value) {
      sliderModel=SliderModel.fromJson(value.data);
      emit(SliderSuccessState());
      print('slider${value.data}');
      print(sliderModel?.data?.data?[1]);

    }
    ).catchError((error){
      print(error);
      emit(SliderErrorState());
    });
  }

}
