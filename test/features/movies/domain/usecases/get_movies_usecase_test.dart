import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';
import 'package:flutter_clean_next/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../../data/samples/movie_sample.dart';

void main() {
  late GetMoviesUsecaseImpl usecaseMovies;
  late MockMoviesRepositoryInterface repository;

  setUp(() {
    repository = MockMoviesRepositoryInterface();
    usecaseMovies = GetMoviesUsecaseImpl(repository: repository);
  });

  group(
    'GetMoviesUsecaseImpl',
    () {
      test(
        'should return a Result.success when repository is success',
        () async {
          final response = Result.success([
            MovieSample.create(),
          ]);
          when(
            repository.getMovies(),
          ).thenAnswer((_) async => response);

          final result = await usecaseMovies();

          expect(result, response);
          verify(
            repository.getMovies(),
          );
        },
      );

      test(
          'should return a Result.failure when the repository returns some Failure',
          () async {
        const response = Result<List<Movie>>.failure(Failure());

        when(
          repository.getMovies(),
        ).thenAnswer((_) async => response);

        final result = await usecaseMovies();

        expect(result, response);
        verify(
          repository.getMovies(),
        );
      });
    },
  );
}
