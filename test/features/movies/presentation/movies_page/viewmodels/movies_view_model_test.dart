import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/core/foundation/failures/failures.dart';
import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';
import 'package:flutter_clean_next/features/movies/presentation/movies_page/viewmodels/movies_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocks/mocks.mocks.dart';
import '../../../data/samples/movie_sample.dart';

void main() {
  late MoviesViewModel viewModel;
  late MockGetMoviesUsecaseInterface getMovies;

  setUp(() {
    getMovies = MockGetMoviesUsecaseInterface();
    viewModel = MoviesViewModel(getMoviesUsecase: getMovies);
  });

  void mockSuccess(List<Movie> movie) {
    when(getMovies()).thenAnswer((_) async => Result.success(movie));
  }

  void mockFailure(Failure f) {
    when(getMovies()).thenAnswer((_) async => Result.failure(f));
  }

  test('Should return success', () async {
    // arrange
    final movie = [
      MovieSample.create(),
      MovieSample.create(),
    ];
    mockSuccess(movie);

    // act
    await viewModel.fetch();

    // assert
    expect(viewModel.moviesState.value, movie);
  });

  test('Should return error when usecase fails', () async {
    // arrange
    const message = 'Você está sem internet, tente novamente.';
    mockFailure(const TimeoutFailure());

    // act
    await viewModel.fetch();

    // assert
    expect(viewModel.moviesState.error?.message, message);
  });
}
