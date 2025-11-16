import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/user_entity.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  late final VoidCallback logOut;

  AppUserCubit() : super(AppUserInitial());

  void updateUser(UserEntity user) {
    emit(AppUserSuccess(user));
  }

  void emitUserInitial() {
    emit(AppUserInitial());
  }
}
