import 'package:flutter_bloc/flutter_bloc.dart';

class NewStatusMessageCubit extends Cubit<String> {
  NewStatusMessageCubit() : super('');

  void updateMessage(String message) {
    emit(message.trim());
  }

  void clear() {
    emit('');
  }
}
