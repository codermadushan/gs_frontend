part of 'barbers_cubit.dart';

@immutable
sealed class BarbersState {
  List<BarberEntity> get barbers;
}

final class BarbersInitial extends BarbersState {
  @override
  final List<BarberEntity> barbers;

  BarbersInitial() : barbers = [];
}

final class BarbersLoading extends BarbersState {
  @override
  final List<BarberEntity> barbers;

  BarbersLoading(this.barbers);
}

final class BarbersLoaded extends BarbersState {
  @override
  final List<BarberEntity> barbers;

  BarbersLoaded(this.barbers);
}

final class BarbersError extends BarbersState {
  final String message;

  @override
  final List<BarberEntity> barbers;

  BarbersError({required this.barbers, required this.message});
}
