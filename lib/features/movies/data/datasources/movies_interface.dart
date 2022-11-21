import '../../../../core/foundation/data/result.dart';
import '../models/movie_model.dart';

abstract class MoviesDataSourceInterface {
  Future<Result<List<MovieModel>>> getMovies();
}
