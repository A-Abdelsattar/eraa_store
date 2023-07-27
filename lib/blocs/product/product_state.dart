part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class GetProductsSuccessState extends ProductState {}
class GetProductsErrorState extends ProductState {
  final String error;
  GetProductsErrorState(this.error);
}
class GetProductsLoadingState extends ProductState{}