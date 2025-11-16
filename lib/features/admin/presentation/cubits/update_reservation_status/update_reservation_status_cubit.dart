import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/reservation_status.dart';
import '../../../domain/usecases/update_reservation_status.dart';

part 'update_reservation_status_state.dart';

class UpdateReservationStatusCubit extends Cubit<UpdateReservationStatusState> {
  final UpdateReservationStatus _updateReservationStatus;

  UpdateReservationStatusCubit(UpdateReservationStatus updateReservationStatus)
    : _updateReservationStatus = updateReservationStatus,
      super(UpdateReservationStatusInitial());

  Future<void> updateReservationStatusParams({
    required int reservationId,
    required ReservationStatus status,
    String? rejectionReason,
    int? finalPrice,
  }) async {
    if (state is UpdateReservationStatusLoading) return;

    emit(UpdateReservationStatusLoading());

    // await Future.delayed(const Duration(seconds: 10));

    final params = UpdateReservationStatusParams(
      reservationId: reservationId,
      status: status,
      finalPrice: finalPrice,
      rejectionReason: rejectionReason,
    );
    final res = await _updateReservationStatus(params);

    res.fold(
      (failure) => emit(UpdateReservationStatusError(failure.message)),

      (_) => emit(UpdateReservationStatusSuccess()),
    );
  }
}
