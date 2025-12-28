import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/status_message_entity.dart';
import '../../../domain/usecases/get_status_message.dart';

part 'get_status_message_state.dart';

class GetStatusMessageCubit extends Cubit<GetStatusMessageState> {
  final GetStatusMessage _getStatusMessage;

  GetStatusMessageCubit({required GetStatusMessage getStatusMessage})
    : _getStatusMessage = getStatusMessage,
      super(GetStatusMessageInitial());

  Future<void> load() async {
    final params = GetStatusMessageParams();
    final res = await _getStatusMessage(params);

    res.fold(
      (failure) {
        emit(GetStatusMessageError(failure.message));
      },

      (statusMessage) {
        emit(GetStatusMessageLoaded(statusMessage));
      },
    );
  }
}
