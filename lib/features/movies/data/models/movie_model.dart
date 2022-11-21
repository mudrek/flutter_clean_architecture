import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String posterImageUrl;
  final double averageRating;

  const MovieModel({
    required this.id,
    required this.title,
    required this.posterImageUrl,
    required this.averageRating,
  });

  @override
  List<Object?> get props => [id, title, posterImageUrl, averageRating];
}
