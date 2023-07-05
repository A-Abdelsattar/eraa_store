part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}
