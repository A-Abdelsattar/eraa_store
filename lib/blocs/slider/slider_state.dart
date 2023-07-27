part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderErrorState extends SliderState {}
class SliderLoadingState extends SliderState {}
class SliderSuccessState extends SliderState {}
