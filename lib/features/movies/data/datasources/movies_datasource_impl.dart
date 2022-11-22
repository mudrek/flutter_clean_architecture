import 'package:dio/dio.dart';

import '../models/movie_model.dart';
import 'movies_datasource_interface.dart';

class MoviesDatasourceImpl implements MoviesDatasourceInterface {
  final Dio dio;

  MoviesDatasourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getMovies() async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/popular',
      queryParameters: {
        'api_key': 'c13a6d80fdb0b0f3219a0d98db11b50e',
        'language': 'pt-BR',
      },
    );

    final result = response.data['results'] as List;
    return result.map((e) => MovieModel.fromJson(e)).toList();
  }
}
