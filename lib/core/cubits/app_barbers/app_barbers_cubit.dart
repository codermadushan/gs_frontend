import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/barber_entity.dart';

part 'app_barbers_state.dart';

class AppBarbersCubit extends Cubit<AppBarbersState> {
  late final VoidCallback loadBarbers;

  AppBarbersCubit() : super(AppBarbersInitial());

  void updateBarbers(List<BarberEntity> barbers) {
    emit(AppBarbersLoaded(barbers));
  }
}
