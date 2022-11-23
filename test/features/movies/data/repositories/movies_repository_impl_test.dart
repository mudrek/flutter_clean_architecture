import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';
import 'package:flutter_clean_next/features/movies/domain/repositories/movies_repository_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../samples/movie_model_sample.dart';
import '../samples/movie_sample.dart';

void main() {
  late MoviesRepositoryInterface repository;
  late MockMoviesDatasourceInterface datasource;
  late MockMoviesExceptionHandler exceptionHandler;

  setUp(() {
    datasource = MockMoviesDatasourceInterface();
    exceptionHandler = MockMoviesExceptionHandler();
    repository = MoviesRepositoryImpl(
      datasource: datasource,
      exceptionHandler: exceptionHandler,
    );
  });

  group(
    'MoviesRepositoryImpl',
    () {
      test(
        'should return a Result.success when datasource is success',
        () async {
          final response = [
            MovieModelSample.create(),
            MovieModelSample.create(),
          ];

          final expected = Result.success([
            MovieSample.create(),
            MovieSample.create(),
          ]);

          when(
            datasource.getMovies(),
          ).thenAnswer((_) async => response);

          final result = await repository.getMovies();

          expect(result, expected);
        },
      );

      test(
        'should return a Result.failure when the datasource returns some Failure',
        () async {
          const expected = Result<List<Movie>>.failure(
            Failure(
              title: 'Conexão instável',
              message:
                  'Dá uma olhada no sinal da sua internet ou tente acessar uma rede WI-FI.',
            ),
          );

          when(datasource.getMovies()).thenThrow(Exception());
          when(
            exceptionHandler.handle(any),
          ).thenReturn(
            const Failure(
              title: 'Conexão instável',
              message:
                  'Dá uma olhada no sinal da sua internet ou tente acessar uma rede WI-FI.',
            ),
          );

          final result = await repository.getMovies();

          expect(result, expected);
        },
      );
    },
  );
}
