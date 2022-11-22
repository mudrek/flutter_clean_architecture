import '../../core/foundation/injector/feature_injector.dart';
import '../../core/foundation/injector/get.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository_interface.dart';
import 'domain/usecases/do_login_usecase.dart';
import 'presentation/login_page/viewmodel/login_view_model.dart';

class LoginInjector extends FeatureInjector {
  @override
  void injectAnalytics() {}

  @override
  void injectRepositories() {
    get.registerFactory<LoginRepositoryInterface>(
      () => LoginRepositoryImpl(
        loginDatasource: get(),
      ),
    );
  }

  @override
  void injectUseCases() {
    get.registerFactory<DoLoginUsecaseInterface>(
      () => DoLoginUsecaseImpl(
        loginRepository: get(),
      ),
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
  void injectExceptionHandler() {}
}
