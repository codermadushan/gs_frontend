import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/update_status_message.dart';

part 'update_status_message_state.dart';

class UpdateStatusMessageCubit extends Cubit<UpdateStatusMessageState> {
  final UpdateStatusMessage _updateStatusMessage;

  UpdateStatusMessageCubit(UpdateStatusMessage updateStatusMessage)
    : _updateStatusMessage = updateStatusMessage,
      super(UpdateStatusMessageInitial());

  Future<void> start(UpdateStatusMessageParams params) async {
    if (state is UpdateStatusMessageLoading) return;

    emit(UpdateStatusMessageLoading());

    final res = await _updateStatusMessage(params);

    res.fold(
      (failure) => emit(UpdateStatusMessageError(failure.message)),

      (_) => emit(UpdateStatusMessageSuccess()),
    );
  }
}
