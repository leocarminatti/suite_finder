import '../entities/go_now_entity.dart';
import '../repositories/go_now_repository.dart';

class FetchAllSuitesUsecase {
  final GoNowRepository repository;

  FetchAllSuitesUsecase(this.repository);

  Future<GoNowDataEntity> call() async {
    return await repository.fetchAll();
  }
}
