import 'package:get_it/get_it.dart';

import '../../core/core.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

class GoNowServiceLocator {
  static void setup(GetIt di) async {
    // DataSources
    getIt.registerLazySingleton<GoNowRemoteDataSource>(
      () => GoNowRemoteDataSourceImpl(
        getIt(),
        'b/1IXK',
      ),
    );

    // Repositories
    getIt.registerLazySingleton<GoNowRepository>(
      () => GoNowRepositoryImpl(
        getIt(),
      ),
    );

    // UseCases
    getIt.registerLazySingleton(
      () => FetchAllSuitesUsecase(
        getIt(),
      ),
    );

    // Cubits
    getIt.registerFactory(
      () => GoNowCubit(
        getIt(),
      ),
    );
  }
}
