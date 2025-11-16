import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/barber_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/barbers_repository.dart';

@immutable
final class LoadBarbersParams {}

final class LoadBarbers
    implements AsyncUseCase<List<BarberEntity>, LoadBarbersParams> {
  final BarbersRepository _barbersRepository;

  const LoadBarbers(BarbersRepository barbersRepository)
    : _barbersRepository = barbersRepository;

  @override
  Future<Either<Failure, List<BarberEntity>>> call(
    LoadBarbersParams params,
  ) async {
    return await _barbersRepository.loadBarbers();
  }
}
