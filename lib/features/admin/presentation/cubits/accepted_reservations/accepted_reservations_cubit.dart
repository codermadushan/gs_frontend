import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/reservation_status.dart';
import '../../../domain/entities/admin_reservation_entity.dart';
import '../../../domain/usecases/load_all_reservations.dart';

part 'accepted_reservations_state.dart';

class AcceptedReservationsCubit extends Cubit<AcceptedReservationsState> {
  final LoadAllReservations _loadAllReservations;

  AcceptedReservationsCubit(LoadAllReservations loadAllReservations)
    : _loadAllReservations = loadAllReservations,
      super(AcceptedReservationsInitial());

  Future<void> loadAllAcceptedReservations() async {
    if (state is AcceptedReservationsLoading) return;

    emit(AcceptedReservationsLoading(state.reservations));

    const params = LoadAllReservationsParams(ReservationStatus.accepted);
    final res = await _loadAllReservations(params);

    res.fold(
      (failure) => emit(
        AcceptedReservationsError(
          reservations: state.reservations,
          message: failure.message,
        ),
      ),

      (reservations) => emit(AcceptedReservationsLoaded(reservations)),
    );
  }
}
