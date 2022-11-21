import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';

extension MovieSample on Movie {
  static Movie create({
    int id = 436270,
    String title = 'Black Adam',
    String posterImageUrl =
        'https://image.tmdb.org/t/p/w300/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
    double averageRating = 7.5,
  }) =>
      Movie(
        id: id,
        title: title,
        posterImageUrl: posterImageUrl,
        averageRating: averageRating,
      );
}
