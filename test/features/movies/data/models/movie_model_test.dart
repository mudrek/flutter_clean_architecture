import 'package:flutter_clean_next/features/movies/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../samples/movie_model_sample.dart';

void main() {
  late MovieModel moviesModel;

  setUp(() {
    moviesModel = MovieModelSample.create();
  });

  test('should return a valid MovieModel', () {
    expect(moviesModel.id, 436270);
    expect(moviesModel.title, 'Black Adam');
    expect(
      moviesModel.posterImageUrl,
      '/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
    );
    expect(moviesModel.averageRating, 7.5);
    expect(moviesModel.overview, 'Dwayne Johnson as Black Adam');
    expect(
      moviesModel.bannerImageUrl,
      '/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg',
    );
  });

  test('should validate MovieModel equatable', () {
    const moviesModel2 = MovieModel(
      id: 436270,
      title: 'Black Adam',
      posterImageUrl: '/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
      averageRating: 7.5,
      overview: 'Dwayne Johnson as Black Adam',
      bannerImageUrl: '/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg',
    );

    expect(moviesModel, moviesModel2);
  });
}
