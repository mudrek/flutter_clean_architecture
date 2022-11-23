import 'package:flutter/material.dart';

import '../../../../core/constants/keys.dart' as keys;
import '../../domain/entities/movie.dart';
import 'widgets/movie_card_details.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title, key: const Key(keys.keyMoviesTitle)),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(widget.movie.bannerImageUrl),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MovieCardDetailsWidget(
                    movie: widget.movie,
                    key: const Key(keys.keyMoviesDetails),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
