part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserSuccess extends AppUserState {
  final UserEntity user;

  AppUserSuccess(this.user);
}
