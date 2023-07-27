part of 'brand_cubit.dart';

@immutable
abstract class BrandState {}

class BrandInitial extends BrandState {}

class GetAllBrandsSuccessState extends BrandState{}
class GetAllBrandsErrorState extends BrandState{
  final String error;
  GetAllBrandsErrorState(this.error);
}
class GetAllBrandsLoadingState extends BrandState{}

class GetProductsOfBrandSuccessState extends BrandState{}
class GetProductsOfBrandErrorState extends BrandState{
  final String error;

  GetProductsOfBrandErrorState(this.error);
}
class GetProductsOfBrandLoadingState extends BrandState{}
