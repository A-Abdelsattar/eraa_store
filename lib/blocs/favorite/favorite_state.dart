part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetFavoriteItemsSuccess extends FavoriteState {}
class GetFavoriteItemsLoading extends FavoriteState {}
class GetFavoriteItemsError extends FavoriteState {}

class AddToFavoriteErrorState extends FavoriteState {}
class AddToFavoriteSuccessState extends FavoriteState {}

class RemoveFromFavoriteSuccessState extends FavoriteState {}
class RemoveFromFavoriteErrorState extends FavoriteState {}

class GetFavoriteSuccessState extends FavoriteState{}
class GetFavoriteErrorState extends FavoriteState{}
class GetFavoriteLoadingState extends FavoriteState{}

