part of 'barber_services_cubit.dart';

@immutable
sealed class BarberServicesState {
  List<ServiceCategoryEntity> get services;
}

final class BarberServicesInitial extends BarberServicesState {
  @override
  final List<ServiceCategoryEntity> services;

  BarberServicesInitial() : services = [];
}

final class BarberServicesLoading extends BarberServicesState {
  @override
  final List<ServiceCategoryEntity> services;

  BarberServicesLoading(this.services);
}

final class BarberServicesLoaded extends BarberServicesState {
  @override
  final List<ServiceCategoryEntity> services;

  BarberServicesLoaded(this.services);
}

final class BarberServicesError extends BarberServicesState {
  final String message;
  @override
  final List<ServiceCategoryEntity> services;

  BarberServicesError({required this.services, required this.message});
}
