import 'package:flutter/material.dart';

import '../../../../../core/constants/keys.dart' as keys;
import '../../../../../core/i18n/i18n.dart';
import '../../../domain/entities/movie.dart';

class MovieCardDetailsWidget extends StatelessWidget {
  const MovieCardDetailsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${I18n.strings.textRating} ${movie.averageRating.toString()}',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  key: const Key(keys.keyMoviesRating),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            movie.overview.isEmpty
                ? Text(
                    I18n.strings.textOverview,
                    key: const Key(keys.keyTextOverview),
                  )
                : Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 20.0),
                    key: const Key(keys.keyMoviesOverview),
                  ),
          ],
        ),
      ),
    );
  }
}
