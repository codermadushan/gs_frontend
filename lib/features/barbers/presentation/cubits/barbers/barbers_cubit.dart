import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/app_barbers/app_barbers_cubit.dart';
import '../../../../../core/entities/barber_entity.dart';
import '../../../domain/usecases/load_barbers.dart';

part 'barbers_state.dart';

class BarbersCubit extends Cubit<BarbersState> {
  final AppBarbersCubit _appBarbersCubit;

  final LoadBarbers _loadBarbers;

  BarbersCubit({
    required AppBarbersCubit appBarbersCubit,
    required LoadBarbers loadBarbers,
  }) : _appBarbersCubit = appBarbersCubit,
       _loadBarbers = loadBarbers,

       super(BarbersInitial()) {
    _appBarbersCubit.loadBarbers = __loadBarbers;
  }

  Future<void> __loadBarbers() async {
    if (state is BarbersLoading) return;

    emit(BarbersLoading(state.barbers));

    final params = LoadBarbersParams();
    final res = await _loadBarbers(params);
    res.fold(
      (failure) {
        emit(BarbersError(barbers: state.barbers, message: failure.message));
      },

      (barbers) {
        _appBarbersCubit.updateBarbers(barbers);
        emit(BarbersLoaded(barbers));
      },
    );
  }
}
