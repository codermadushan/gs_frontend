import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/service_category_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/barbers_repository.dart';

@immutable
final class LoadBarberServicesParams {
  final int barberId;

  const LoadBarberServicesParams(this.barberId);
}

final class LoadBarberServices
    implements
        AsyncUseCase<List<ServiceCategoryEntity>, LoadBarberServicesParams> {
  final BarbersRepository _barbersRepository;

  const LoadBarberServices(BarbersRepository barbersRepository)
    : _barbersRepository = barbersRepository;

  @override
  Future<Either<Failure, List<ServiceCategoryEntity>>> call(
    LoadBarberServicesParams params,
  ) async {
    return await _barbersRepository.loadBarberServices(params.barberId);
  }
}
