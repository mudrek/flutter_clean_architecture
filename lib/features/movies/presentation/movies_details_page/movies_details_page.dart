import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';

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
        title: Text(widget.movie.title),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Image.network(widget.movie.posterImageUrl),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.movie.averageRating.toString(),
                            style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(widget.movie.overview),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
