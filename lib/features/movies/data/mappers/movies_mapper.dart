import '../../domain/entities/movie.dart';
import '../models/movie_model.dart';

class MoviesMapper {
  static Movie toEntity(MovieModel movie) {
    return Movie(
      id: movie.id,
      title: movie.title,
      posterImageUrl: 'https://image.tmdb.org/t/p/w300${movie.posterImageUrl}',
      averageRating: movie.averageRating,
    );
  }
}
