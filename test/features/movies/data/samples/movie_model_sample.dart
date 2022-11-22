import 'package:flutter_clean_next/features/movies/data/models/movie_model.dart';

extension MovieModelSample on MovieModel {
  static MovieModel create({
    int id = 436270,
    String title = 'Black Adam',
    String posterImageUrl = '/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
    double averageRating = 7.5,
    String overview = 'Dwayne Johnson as Black Adam',
  }) =>
      MovieModel(
        id: id,
        title: title,
        posterImageUrl: posterImageUrl,
        averageRating: averageRating,
        overview: overview,
      );

  static Map<String, dynamic> createMap() => {
        'id': 436270,
        'title': 'Black Adam',
        'poster_path': '/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg',
        'vote_average': 7.5,
        'overview': 'Dwayne Johnson as Black Adam',
      };
}
