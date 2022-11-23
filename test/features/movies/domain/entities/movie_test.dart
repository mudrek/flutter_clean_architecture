import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import '../samples/movies_sample.dart';

void main() {
  late Movie movie;

  setUp(() {
    movie = MovieSample.create();
  });

  test('should return a valid Movie', () {
    expect(movie.id, 436270);
    expect(movie.title, 'Black Adam');
    expect(
      movie.posterImageUrl,
      'https://image.tmdb.org/t/p/w500/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
    );
    expect(movie.averageRating, 7.5);
    expect(movie.overview, 'Dwayne Johnson as Black Adam');
    expect(
      movie.bannerImageUrl,
      'https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg',
    );
  });

  test('should validate MovieModel equatable', () {
    const movie2 = Movie(
      id: 436270,
      title: 'Black Adam',
      posterImageUrl:
          'https://image.tmdb.org/t/p/w500/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
      averageRating: 7.5,
      overview: 'Dwayne Johnson as Black Adam',
      bannerImageUrl:
          'https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg',
    );

    expect(movie, movie2);
  });
}
