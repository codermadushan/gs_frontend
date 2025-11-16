import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/app_barber_services/app_barber_services_cubit.dart';
import '../../../../../core/entities/service_category_entity.dart';
import '../../../domain/usecases/load_barber_services.dart';

part 'barber_services_state.dart';

class BarberServicesCubit extends Cubit<BarberServicesState> {
  final AppBarberServicesCubit _appBarberServicesCubit;

  final LoadBarberServices _loadBarberServices;

  BarberServicesCubit({
    required AppBarberServicesCubit appBarberServicesCubit,
    required LoadBarberServices loadBarberServices,
  }) : _appBarberServicesCubit = appBarberServicesCubit,
       _loadBarberServices = loadBarberServices,
       super(BarberServicesInitial()) {
    _appBarberServicesCubit.loadBarberServices = __loadBarberServices;
  }

  Future<void> __loadBarberServices(int barberId) async {
    if (state is BarberServicesLoading) return;

    _appBarberServicesCubit.emitLoadingState(state.services);
    emit(BarberServicesLoading(state.services));

    final params = LoadBarberServicesParams(barberId);
    final res = await _loadBarberServices(params);
    res.fold(
      (failure) {
        _appBarberServicesCubit.emitErrorState(
          message: failure.message,
          services: state.services,
        );

        emit(
          BarberServicesError(
            services: state.services,
            message: failure.message,
          ),
        );
      },

      (services) {
        _appBarberServicesCubit.emitLoadedState(services);
        emit(BarberServicesLoaded(services));
      },
    );
  }
}
