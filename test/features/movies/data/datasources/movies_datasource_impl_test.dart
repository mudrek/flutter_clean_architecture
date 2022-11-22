import 'package:dio/dio.dart';
import 'package:flutter_clean_next/features/movies/data/datasources/movies_datasource_impl.dart';
import 'package:flutter_clean_next/features/movies/data/datasources/movies_datasource_interface.dart';
import 'package:flutter_clean_next/features/movies/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../samples/movie_model_sample.dart';

void main() {
  late MoviesDatasourceInterface moviesDatasourceInterface;
  late MockDio dio;

  setUp(() {
    dio = MockDio();
    moviesDatasourceInterface = MoviesDatasourceImpl(dio: dio);
  });

  void mockQuerySuccess() {
    final result = {
      'results': [
        MovieModelSample.createMap(),
        MovieModelSample.createMap(),
      ]
    };

    when(
      dio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: result,
        requestOptions: RequestOptions(
          path: 'https://api.themoviedb.org/3/movie/popular',
        ),
      ),
    );
  }

  void mockQueryFailure() {
    final result = {
      'status_message': 'Backend error',
    };

    when(
      dio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      ),
    ).thenThrow(
      Exception(result['status_message']),
    );
  }

  test(
      'Should return a list of movies when the response code equals 200 (success)',
      () async {
    MovieModel sample = MovieModelSample.create();

    mockQuerySuccess();

    final result = await moviesDatasourceInterface.getMovies();

    final movieResult = result.first;

    expect(result.length, isNot(0));
    expect(movieResult, sample);
    verify(
      dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        queryParameters: {
          'api_key': 'c13a6d80fdb0b0f3219a0d98db11b50e',
          'language': 'pt-BR',
        },
      ),
    );

    verifyNoMoreInteractions(dio);
  });

  test('Should throw an exception when getMovies throws an error', () async {
    mockQueryFailure();

    expect(
      () async => await moviesDatasourceInterface.getMovies(),
      throwsA(isA<Exception>()),
    );
    verify(
      dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        queryParameters: {
          'api_key': 'c13a6d80fdb0b0f3219a0d98db11b50e',
          'language': 'pt-BR',
        },
      ),
    ).called(1);
  });
}
