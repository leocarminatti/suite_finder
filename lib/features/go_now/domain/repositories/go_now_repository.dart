import '../entities/go_now_entity.dart';

abstract class GoNowRepository {
  Future<GoNowDataEntity> fetchAll();
}
