import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/service_category_entity.dart';

part 'app_barber_services_state.dart';

class AppBarberServicesCubit extends Cubit<AppBarberServicesState> {
  late final void Function(int) loadBarberServices;

  AppBarberServicesCubit() : super(AppBarberServicesInitial());

  void emitLoadingState(List<ServiceCategoryEntity> services) {
    emit(AppBarberServicesLoading(services));
  }

  void emitLoadedState(List<ServiceCategoryEntity> services) {
    emit(AppBarberServicesLoaded(services));
  }

  void emitErrorState({
    required List<ServiceCategoryEntity> services,
    required String message,
  }) {
    emit(AppBarberServicesError(message: message, services: services));
  }
}
