import '../../../../core/foundation/data/result.dart';
import '../entities/movie.dart';

abstract class GetMoviesUsecaseInterface {
  Future<Result<List<Movie>>> call();
}
