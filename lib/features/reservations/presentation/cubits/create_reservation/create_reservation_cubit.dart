import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/create_reservation.dart';

part 'create_reservation_state.dart';

class CreateReservationCubit extends Cubit<CreateReservationState> {
  final CreateReservation _createReservation;

  CreateReservationCubit(CreateReservation createReservation)
    : _createReservation = createReservation,
      super(CreateReservationInitial());

  Future<void> createReservation(CreateReservationParams params) async {
    if (state is CreateReservationLoading) return;

    emit(CreateReservationLoading());

    final res = await _createReservation(params);
    res.fold(
      (failure) => emit(CreateReservationError(failure.message)),

      (_) => emit(CreateReservationSuccess()),
    );
  }
}
