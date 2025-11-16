import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/delete_reservation.dart';

part 'delete_reservation_state.dart';

class DeleteReservationCubit extends Cubit<DeleteReservationState> {
  final DeleteReservation _deleteReservation;

  DeleteReservationCubit(DeleteReservation deleteReservation)
    : _deleteReservation = deleteReservation,
      super(DeleteReservationInitial());

  Future<void> deleteReservation(int reservationId) async {
    if (state is DeleteReservationLoading) return;

    emit(DeleteReservationLoading());

    final params = DeleteReservationParams(reservationId);
    final res = await _deleteReservation(params);

    res.fold(
      (failure) => emit(DeleteReservationError(failure.message)),

      (_) => emit(DeleteReservationSuccess()),
    );
  }
}
