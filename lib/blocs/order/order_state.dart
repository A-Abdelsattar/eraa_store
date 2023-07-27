part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderHistorySuccess extends OrderState {}
class OrderHistoryError extends OrderState {}
class OrderHistoryLoading extends OrderState {}
