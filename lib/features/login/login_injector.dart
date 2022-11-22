import '../../core/foundation/injector/feature_injector.dart';
import '../../core/foundation/injector/get.dart';
import 'data/handlers/login_exception_handler.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository_interface.dart';
import 'domain/usecases/do_login_usecase.dart';
import 'domain/validators/login_validators_impl.dart';
import 'presentation/login_page/validators/login_validators_interface.dart';
import 'presentation/login_page/viewmodel/login_view_model.dart';

class LoginInjector extends FeatureInjector {
  @override
  void injectAnalytics() {}

  @override
  void injectRepositories() {
    get.registerFactory<LoginRepositoryInterface>(
      () => LoginRepositoryImpl(
        loginDatasource: get(),
        exceptionHandler: get(),
      ),
    );
  }

  @override
  void injectUseCases() {
    get
      ..registerFactory<DoLoginUsecaseInterface>(
        () => DoLoginUsecaseImpl(
          loginRepository: get(),
        ),
      )
      ..registerFactory<LoginValidatorsInterface>(
        () => LoginValidatorsImpl(),
      );
  }

  @override
  void injectViewModels() {
    get.registerFactory<LoginViewModel>(
      () => LoginViewModel(
        doLoginUsecase: get(),
      ),
    );
  }

  @override
  void injectExceptionHandler() {
    get.registerLazySingleton<LoginExceptionHandler>(
      () => LoginExceptionHandler(),
    );
  }
}
