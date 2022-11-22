import 'package:flutter/material.dart';
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
      final movieCardWidget = find.byKey(const Key('movie_details'));
      final titleFinder = find.byKey(const Key('movie_title'));
      final ratingFinder = find.byKey(const Key('movie_rating'));
      final overviewFinder = find.byKey(const Key('movie_overview'));

      expect(titleFinder, findsOneWidget);
      expect(ratingFinder, findsOneWidget);
      expect(overviewFinder, findsOneWidget);
      expect(movieCardWidget, findsOneWidget);
    });
  });
}
