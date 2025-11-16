part of 'app_barber_services_cubit.dart';

@immutable
sealed class AppBarberServicesState {
  List<ServiceCategoryEntity> get services;
}

final class AppBarberServicesInitial extends AppBarberServicesState {
  @override
  final List<ServiceCategoryEntity> services;

  AppBarberServicesInitial() : services = [];
}

final class AppBarberServicesLoading extends AppBarberServicesState {
  @override
  final List<ServiceCategoryEntity> services;

  AppBarberServicesLoading(this.services);
}

final class AppBarberServicesLoaded extends AppBarberServicesState {
  @override
  final List<ServiceCategoryEntity> services;

  AppBarberServicesLoaded(this.services);
}

final class AppBarberServicesError extends AppBarberServicesState {
  final String message;
  @override
  final List<ServiceCategoryEntity> services;

  AppBarberServicesError({required this.services, required this.message});
}
