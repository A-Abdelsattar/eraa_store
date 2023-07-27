part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class GetAllCategoriesSuccessState extends CategoryState {}
class GetAllCategoriesErrorState extends CategoryState {
  final String error;
  GetAllCategoriesErrorState(this.error);
}
class GetAllCategoriesLoadingState extends CategoryState {}

class GetProductsOfCategoryLoadingState extends CategoryState {}
class GetProductsOfCategorySuccessState extends CategoryState {}
class GetProductsOfCategoryErrorState extends CategoryState {}


