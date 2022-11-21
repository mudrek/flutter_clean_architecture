import '../entities/movie.dart';

abstract class MoviesRepositoryInterface {
  Future<List<Movie>> getMovies();
}
