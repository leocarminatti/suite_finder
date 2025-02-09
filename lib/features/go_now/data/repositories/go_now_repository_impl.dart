import '../../domain/entities/go_now_entity.dart';
import '../../domain/repositories/go_now_repository.dart';
import '../datasources/go_now_remote_data_source.dart';

class GoNowRepositoryImpl implements GoNowRepository {
  final GoNowRemoteDataSource remoteDataSource;

  GoNowRepositoryImpl(this.remoteDataSource);

  @override
  Future<GoNowDataEntity> fetchAll() async {
    try {
      return await remoteDataSource.fetchAll();
    } catch (e) {
      throw Exception('Failed to get available trips');
    }
  }
}
