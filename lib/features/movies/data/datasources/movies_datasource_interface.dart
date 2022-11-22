import '../models/movie_model.dart';

abstract class MoviesDatasourceInterface {
  Future<List<MovieModel>> getMovies();
}
