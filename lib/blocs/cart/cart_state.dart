part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class AddToCartSuccessState extends CartState {}
class AddToCartErrorState extends CartState {}

class GetCartErrorState extends CartState {}
class GetCartSuccessState extends CartState {}
class GetCartLoadingState extends CartState {}

class RemoveFromCartErrorState extends CartState {}
class RemoveFromCartSuccessState extends CartState {}
class RemoveFromCartLoadingState extends CartState {}

class UpdateCartErrorState extends CartState {}
class UpdateCartSuccessState extends CartState {}
class UpdateCartLoadingState extends CartState {}

class CheckOutErrorState extends CartState {}
class CheckOutSuccessState extends CartState {}
class CheckOutLoadingState extends CartState {}

class OrderErrorState extends CartState {}
class OrderSuccessState extends CartState {}
class OrderLoadingState extends CartState {}


