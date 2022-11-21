import '../models/movie_model.dart';

abstract class MoviesDataSourceInterface {
  Future<List<MovieModel>> getMovies();
}
