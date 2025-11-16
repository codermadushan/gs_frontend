import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/user_reservation_entity.dart';

part 'app_user_reservations_state.dart';

class AppUserReservationsCubit extends Cubit<AppUserReservationsState> {
  late final VoidCallback loadUserReservations;

  AppUserReservationsCubit() : super(AppUserReservationsInitial());

  void emitLoadingState(List<UserReservationEntity> reservations) {
    emit(AppUserReservationsLoading(reservations));
  }

  void emitLoadedState(List<UserReservationEntity> reservations) {
    emit(AppUserReservationsLoaded(reservations));
  }

  void emitErrorState({
    required List<UserReservationEntity> reservations,
    required String message,
  }) {
    emit(
      AppUserReservationsError(reservations: reservations, message: message),
    );
  }
}
