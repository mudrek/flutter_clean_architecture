import '../../../../core/foundation/data/result.dart';
import '../entities/movie.dart';
import '../repositories/movies_repository_interface.dart';

abstract class GetMoviesUsecaseInterface {
  Future<Result<List<Movie>>> call();
}

class GetMoviesUsecaseImpl implements GetMoviesUsecaseInterface {
  final MoviesRepositoryInterface repository;

  GetMoviesUsecaseImpl({required this.repository});

  @override
  Future<Result<List<Movie>>> call() => repository.getMovies();
}
