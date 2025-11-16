import '../models/barber_model.dart';
import '../models/service_category_model.dart';

abstract interface class BarbersDataSource {
  Future<List<BarberModel>> loadBarbers();

  Future<List<ServiceCategoryModel>> loadBarberServices(int barberId);
}
