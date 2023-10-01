part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class AuthInitial extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final String message;
  RegisterSuccessState(this.message);
}

final class RegisterErrorState extends RegisterState {}

final class VerifySuccessState extends RegisterState {
  final String message;
  VerifySuccessState(this.message);
}

final class VerifyErrorState extends RegisterState {}
