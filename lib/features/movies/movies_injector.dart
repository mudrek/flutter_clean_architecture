import '../../core/foundation/injector/feature_injector.dart';
import '../../core/foundation/injector/get.dart';
import 'data/handlers/movies_exception_handler.dart';
import 'data/repositories/movies_repository_impl.dart';
import 'domain/repositories/movies_repository_interface.dart';
import 'domain/usecases/get_movies_usecase.dart';
import 'presentation/movies_page/viewmodels/movies_view_model.dart';

class MoviesInjector extends FeatureInjector {
  @override
  void injectAnalytics() {}

  @override
  void injectRepositories() {
    get.registerFactory<MoviesRepositoryInterface>(
      () => MoviesRepositoryImpl(
        exceptionHandler: get(),
        datasource: get(),
      ),
    );
  }

  @override
  void injectUseCases() {
    get.registerFactory<GetMoviesUsecaseInterface>(
      () => GetMoviesUsecaseImpl(
        repository: get(),
      ),
    );
  }

  @override
  void injectViewModels() {
    get.registerFactory<MoviesViewModel>(
      () => MoviesViewModel(
        getMoviesUsecase: get(),
      ),
    );
  }

  @override
  void injectExceptionHandler() {
    get.registerFactory<MoviesExceptionHandler>(
      () => MoviesExceptionHandler(),
    );
  }
}
