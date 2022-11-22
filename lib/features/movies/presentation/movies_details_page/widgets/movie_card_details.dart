import 'package:flutter/material.dart';

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
                  'Rating: ${movie.averageRating.toString()}',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  key: const Key('movie_rating'),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            movie.overview.isEmpty
                ? const Text('No overview')
                : Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 20.0),
                    key: const Key('movie_overview'),
                  ),
          ],
        ),
      ),
    );
  }
}
