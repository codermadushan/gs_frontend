import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/reservation_status.dart';
import '../../../domain/entities/admin_reservation_entity.dart';
import '../../../domain/usecases/load_all_reservations.dart';

part 'pending_reservations_state.dart';

class PendingReservationsCubit extends Cubit<PendingReservationsState> {
  final LoadAllReservations _loadAllReservations;

  PendingReservationsCubit(LoadAllReservations loadAllReservations)
    : _loadAllReservations = loadAllReservations,
      super(PendingReservationsInitial());

  Future<void> loadAllPendingReservations() async {
    if (state is PendingReservationsLoading) return;

    emit(PendingReservationsLoading(state.reservations));

    const params = LoadAllReservationsParams(ReservationStatus.pending);
    final res = await _loadAllReservations(params);

    res.fold(
      (failure) => emit(
        PendingReservationsError(
          reservations: state.reservations,
          message: failure.message,
        ),
      ),

      (reservations) => emit(PendingReservationsLoaded(reservations)),
    );
  }
}
