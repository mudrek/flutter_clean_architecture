import '../../../../core/foundation/base_repository/base_repository.dart';
import '../../../../core/foundation/data/result.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movies_repository_interface.dart';
import '../datasources/movies_datasource_interface.dart';
import '../handlers/movies_exception_handler.dart';
import '../mappers/movies_mapper.dart';

class MoviesRepositoryImpl extends BaseRepository<MoviesExceptionHandler>
    implements MoviesRepositoryInterface {
  final MoviesDatasourceInterface datasource;

  MoviesRepositoryImpl({
    required this.datasource,
    required MoviesExceptionHandler exceptionHandler,
  }) : super(exceptionHandler: exceptionHandler);

  @override
  Future<Result<List<Movie>>> getMovies() async {
    return await exec<List<Movie>>(() async {
      final result = await datasource.getMovies();

      return result.map((e) => MoviesMapper.toEntity(e)).toList();
    });
  }
}
