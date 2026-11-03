import '../../models/recycling_center.dart';

abstract class CenterRepository {
  Future<List<RecyclingCenter>> obtenerCentros();
}
