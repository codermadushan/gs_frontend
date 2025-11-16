part of 'app_barbers_cubit.dart';

@immutable
sealed class AppBarbersState {
  List<BarberEntity> get barbers;
}

final class AppBarbersInitial extends AppBarbersState {
  @override
  final List<BarberEntity> barbers;

  AppBarbersInitial() : barbers = [];
}

final class AppBarbersLoaded extends AppBarbersState {
  @override
  final List<BarberEntity> barbers;

  AppBarbersLoaded(this.barbers);
}
