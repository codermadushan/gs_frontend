import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/status_message_color.dart';

class SelectedMessageColorCubit extends Cubit<StatusMessageColor?> {
  SelectedMessageColorCubit() : super(null);

  void updateSelectedColor(StatusMessageColor color) {
    emit(color);
  }

  void clear() {
    emit(null);
  }
}
