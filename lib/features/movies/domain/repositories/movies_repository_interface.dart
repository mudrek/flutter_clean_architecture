import '../../../../core/foundation/data/result.dart';
import '../entities/movie.dart';

abstract class MoviesRepositoryInterface {
  Future<Result<List<Movie>>> getMovies();
}
