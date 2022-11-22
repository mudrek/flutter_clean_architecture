import 'package:flutter/material.dart';

import '../../../../../core/constants/keys.dart';
import '../../../domain/entities/movie.dart';
import '../../movies_details_page/movies_details_page.dart';

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
      onTap: () => onTap(context),
      key: const Key(keyMoviesListTile),
    );
  }

  void onTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MovieDetailsPage(movie: movie),
      ),
    );
  }
}
