import 'package:flutter_clean_next/features/movies/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../samples/movie_model_sample.dart';

void main() {
  late MovieModel moviesModel;

  setUp(() {
    moviesModel = MovieModelSample.create();
  });

  test('deve retornar um MovieModel válido', () {
    expect(moviesModel.id, 436270);
    expect(moviesModel.title, 'Black Adam');
    expect(
      moviesModel.posterImageUrl,
      '/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
    );
    expect(moviesModel.averageRating, 7.5);
  });

  test('deve validar MovieModel equatable', () {
    const moviesModel2 = MovieModel(
      id: 436270,
      title: 'Black Adam',
      posterImageUrl: '/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
      averageRating: 7.5,
    );

    expect(moviesModel, moviesModel2);
  });
}
