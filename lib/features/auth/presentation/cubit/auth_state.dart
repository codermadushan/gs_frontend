part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthOTPSent extends AuthState {
  final String name;
  final String email;

  AuthOTPSent({required this.name, required this.email});
}

final class AuthSuccess extends AuthState {
  final UserEntity user;

  AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

final class AuthLoading extends AuthState {}
