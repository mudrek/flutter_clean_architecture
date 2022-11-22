import 'package:flutter/material.dart';
import 'package:flutter_clean_next/core/constants/keys.dart';
import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';
import 'package:flutter_clean_next/features/movies/presentation/movies_details_page/movies_details_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../data/samples/movie_sample.dart';

void main() {
  late Widget testWidget;
  late Movie movie;

  setUp(() {
    movie = MovieSample.create();

    testWidget = MaterialApp(
      home: MovieDetailsPage(
        movie: movie,
      ),
    );
  });

  testWidgets('MovieDetailsPage', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(testWidget);
      final movieCardWidget = find.byKey(const Key(keyMoviesDetails));
      final titleFinder = find.byKey(const Key(keyMoviesTitle));
      final ratingFinder = find.byKey(const Key(keyMoviesRating));
      final overviewFinder = find.byKey(const Key(keyMoviesOverview));
      final textOverviewFinder = find.byKey(const Key(keyTextOverview));

      expect(titleFinder, findsOneWidget);
      expect(ratingFinder, findsOneWidget);
      expect(overviewFinder, findsOneWidget);
      expect(movieCardWidget, findsOneWidget);
      expect(textOverviewFinder, findsNothing);
    });
  });

  testWidgets('MovieDetailsPage with empty overview', (tester) async {
    movie = MovieSample.create(overview: '');

    testWidget = MaterialApp(
      home: MovieDetailsPage(
        movie: movie,
      ),
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(testWidget);
      final movieCardWidget = find.byKey(const Key(keyMoviesDetails));
      final titleFinder = find.byKey(const Key(keyMoviesTitle));
      final ratingFinder = find.byKey(const Key(keyMoviesRating));
      final overviewFinder = find.byKey(const Key(keyMoviesOverview));
      final textOverviewFinder = find.byKey(const Key(keyTextOverview));

      expect(titleFinder, findsOneWidget);
      expect(ratingFinder, findsOneWidget);
      expect(overviewFinder, findsNothing);
      expect(movieCardWidget, findsOneWidget);
      expect(textOverviewFinder, findsOneWidget);
    });
  });
}
