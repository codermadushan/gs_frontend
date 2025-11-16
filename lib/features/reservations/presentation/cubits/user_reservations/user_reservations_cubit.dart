import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/app_user_reservations/app_user_reservations_cubit.dart';
import '../../../../../core/entities/user_reservation_entity.dart';
import '../../../domain/usecases/load_user_reservations.dart';

part 'user_reservations_state.dart';

class UserReservationsCubit extends Cubit<UserReservationsState> {
  final AppUserReservationsCubit _appUserReservationsCubit;

  final LoadUserReservations _loadUserReservations;

  UserReservationsCubit({
    required LoadUserReservations loadUserReservations,
    required AppUserReservationsCubit appUserReservationsCubit,
  }) : _loadUserReservations = loadUserReservations,
       _appUserReservationsCubit = appUserReservationsCubit,
       super(UserReservationsInitial()) {
    _appUserReservationsCubit.loadUserReservations = __loadUserReservations;
  }

  Future<void> __loadUserReservations() async {
    if (state is UserReservationsLoading) return;

    emit(UserReservationsLoading(state.reservations));
    _appUserReservationsCubit.emitLoadingState(state.reservations);

    final params = LoadUserReservationsParams();
    final res = await _loadUserReservations(params);

    res.fold(
      (failure) {
        emit(
          UserReservationsError(
            message: failure.message,
            reservations: state.reservations,
          ),
        );
        _appUserReservationsCubit.emitErrorState(
          reservations: state.reservations,
          message: failure.message,
        );
      },

      (reservations) {
        emit(UserReservationsLoaded(reservations));
        _appUserReservationsCubit.emitLoadedState(reservations);
      },
    );
  }
}
