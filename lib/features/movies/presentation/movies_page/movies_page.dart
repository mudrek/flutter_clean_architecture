import 'package:flutter/material.dart';

import '../../../../core/constants/keys.dart';
import '../../../../core/foundation/injector/get.dart';
import '../../../../core/foundation/states/view_state_builder.dart';
import '../../../../core/i18n/i18n.dart';
import '../../domain/entities/movie.dart';
import 'viewmodels/movies_view_model.dart';
import 'widgets/movie_tile_widget.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesViewModel viewModel = get();

  @override
  void initState() {
    viewModel.fetch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key(keyMoviesListAppBar),
        title: Text(I18n.strings.textMoviesList),
      ),
      body: ViewStateBuilder<List<Movie>>(
        state: viewModel.moviesState,
        builder: (_, state) {
          final movies = state.value;

          if (movies != null && movies.isNotEmpty) {
            return ListView.builder(
              key: const Key(keyMoviesList),
              itemCount: movies.length,
              itemBuilder: (_, index) {
                final movie = movies[index];
                return MovieTileWidget(movie: movie);
              },
            );
          }

          if (state.loading) {
            return const Center(
              key: Key(keyMoviesCicularProgressIndicator),
              child: CircularProgressIndicator(),
            );
          }

          if (state.error != null) {
            return Center(
              key: const Key(keyMoviesErrorText),
              child: Text(state.error!.message),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
