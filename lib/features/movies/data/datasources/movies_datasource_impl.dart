import 'package:dio/dio.dart';

import '../models/movie_model.dart';
import 'movies_datasource_interface.dart';

class MoviesDatasourceImpl implements MoviesDatasourceInterface {
  final Dio dio;

  MoviesDatasourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getMovies() async {
    // TODO verificar toJson e fromJson
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/popular',
      queryParameters: {
        'apiKey': '95f97e6483bb4760836f59dbebd7434a',
        'language': 'pt-BR',
      },
    );

    return response.data.map((e) => MovieModel.fromJson(e)).toList();
  }
}
