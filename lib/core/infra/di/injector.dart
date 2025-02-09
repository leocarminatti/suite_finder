import 'package:get_it/get_it.dart';
import 'package:suite_finder/features/go_now/go_now.dart';

import '../http/http.dart';

final getIt = GetIt.instance;

class Injector {
  static void init() {
    // Core
    getIt.registerLazySingleton<HttpClient>(
      () => HttpClientImpl(
        baseUrl: 'https://www.jsonkeeper.com/',
        interceptor: DefaultInterceptor(),
      ),
    );

    GoNowServiceLocator.setup(getIt);
  }
}
