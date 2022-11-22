import 'package:dio/dio.dart';

import 'core/data/handlers/clean_next_exception_handler.dart';
import 'core/foundation/injector/feature_injector.dart';
import 'core/foundation/injector/get.dart';
import 'features/login/data/datasources/login_datasource_impl.dart';
import 'features/login/data/datasources/login_datasource_interface.dart';
import 'features/login/login_injector.dart';

abstract class EnvInjectors {
  Map<String, dynamic> arguments = {};

  List<FeatureInjector> featureInjectors = [LoginInjector()];

  Future<void> inject() async {
    get.registerLazySingleton<CleanNextExceptionHandler>(
      () => CleanNextExceptionHandler(),
    );

    injectDatasources();

    featureInjectors.forEach(((e) => e.inject()));
  }

  void injectDatasources();
}

class ReleaseInjectors extends EnvInjectors {
  ReleaseInjectors() : super();

  @override
  void injectDatasources() {
    get.registerLazySingleton<Dio>(
      () => Dio(),
    );

    get.registerFactory<LoginDatasourceInterface>(
      () => LoginDatasourceImpl(
        dio: get(),
      ),
    );
  }
}

class MockInjectors extends EnvInjectors {
  MockInjectors() : super();

  @override
  void injectDatasources() {}
}
