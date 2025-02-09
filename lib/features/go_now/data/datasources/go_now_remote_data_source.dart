import '../../../../core/core.dart';
import '../models/go_now_model.dart';

abstract class GoNowRemoteDataSource {
  Future<GoNowDataModel> fetchAll();
}

class GoNowRemoteDataSourceImpl implements GoNowRemoteDataSource {
  final HttpClient httpClient;
  final String path;

  GoNowRemoteDataSourceImpl(this.httpClient, this.path);

  @override
  Future<GoNowDataModel> fetchAll() async {
    try {
      final response = await httpClient.get(path);
      return GoNowDataModel.fromJson(response.data['data']);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
