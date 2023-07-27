part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class GetUserDataSuccessState extends ProfileState {}
class GetUserDataErrorState extends ProfileState {}
class GetUserDataLoadingState extends ProfileState {}
class UpdateUserDataSuccessState extends ProfileState {}
class UpdateUserDataErrorState extends ProfileState {}
class UpdateUserDataLoadingState extends ProfileState {}

class UploadSuccessState1 extends ProfileState {}
class UploadLoadingState1 extends ProfileState {}
