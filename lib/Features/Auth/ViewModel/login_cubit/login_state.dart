part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String successMessage;
  LoginSuccess(this.successMessage);
}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}
