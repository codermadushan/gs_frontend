import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/barber_entity.dart';
import '../../../../core/entities/service_category_entity.dart';
import '../../../../core/errors/failure.dart';

abstract interface class BarbersRepository {
  Future<Either<Failure, List<BarberEntity>>> loadBarbers();

  Future<Either<Failure, List<ServiceCategoryEntity>>> loadBarberServices(
    int barberId,
  );
}
