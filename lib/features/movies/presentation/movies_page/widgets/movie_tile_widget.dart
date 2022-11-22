import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieTileWidget extends StatelessWidget {
  final Movie movie;

  const MovieTileWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
      subtitle: Text('Rating: ${movie.averageRating.toString()}'),
      leading: SizedBox(
        height: 100,
        width: 50,
        child: Hero(
          tag: movie.id,
          child: Image.network(movie.posterImageUrl),
        ),
      ),
    );
  }
}
