import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/barber_entity.dart';
import '../../../../core/entities/service_category_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/repositories/barbers_repository.dart';
import '../datasources/barbers_data_source.dart';

final class BarbersRemoteRepository implements BarbersRepository {
  final BarbersDataSource _barbersDataSource;

  const BarbersRemoteRepository(BarbersDataSource barbersDataSource)
    : _barbersDataSource = barbersDataSource;

  @override
  Future<Either<Failure, List<BarberEntity>>> loadBarbers() async {
    try {
      final barberModels = await _barbersDataSource.loadBarbers();
      return right(barberModels);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ServiceCategoryEntity>>> loadBarberServices(
    int barberId,
  ) async {
    try {
      final res = await _barbersDataSource.loadBarberServices(barberId);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
