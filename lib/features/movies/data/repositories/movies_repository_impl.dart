import '../../../../core/data/handlers/clean_next_exception_handler.dart';
import '../../../../core/foundation/base_repository/base_repository.dart';
import '../../../../core/foundation/data/result.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movies_repository_interface.dart';
import '../datasources/movies_datasource_interface.dart';
import '../mappers/movies_mapper.dart';

class MoviesRepositoryImpl extends BaseRepository<CleanNextExceptionHandler>
    implements MoviesRepositoryInterface {
  final MoviesDatasourceInterface datasource;

  MoviesRepositoryImpl({
    required this.datasource,
    required CleanNextExceptionHandler exceptionHandler,
  }) : super(exceptionHandler: exceptionHandler);

  @override
  Future<Result<List<Movie>>> getMovies() async {
    return await exec<List<Movie>>(() async {
      final result = await datasource.getMovies();

      return result.map((e) => MoviesMapper.toEntity(e)).toList();
    });
  }
}
