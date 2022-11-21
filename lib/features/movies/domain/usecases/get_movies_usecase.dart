import '../entities/movie.dart';

abstract class GetMoviesUsecaseInterface {
  Future<List<Movie>> call();
}
