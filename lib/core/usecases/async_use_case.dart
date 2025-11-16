import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

abstract interface class AsyncUseCase<SuccessType, ParamsType> {
  Future<Either<Failure, SuccessType>> call(ParamsType params);
}
