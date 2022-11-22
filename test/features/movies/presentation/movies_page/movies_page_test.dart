import 'package:flutter/material.dart';
import 'package:flutter_clean_next/core/constants/keys.dart';
import 'package:flutter_clean_next/core/foundation/injector/get.dart';
import 'package:flutter_clean_next/core/foundation/states/state.dart';
import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';
import 'package:flutter_clean_next/features/movies/presentation/movies_page/movies_page.dart';
import 'package:flutter_clean_next/features/movies/presentation/movies_page/viewmodels/movies_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../../data/samples/movie_sample.dart';

void main() {
  late Widget testWidget;
  late MoviesViewModel moviesViewModel;
  late ViewState<List<Movie>> moviesState;

  setUp(() {
    moviesState = ViewState<List<Movie>>()..loading = false;

    moviesViewModel = MockMoviesViewModel();
    get.registerFactory<MoviesViewModel>(
      () => moviesViewModel,
    );

    testWidget = const MaterialApp(
      home: MoviesPage(),
    );
  });

  tearDown(() {
    get.unregister<MoviesViewModel>();
  });

  Future<void> mockStates(tester) async {
    when(moviesViewModel.moviesState).thenReturn(moviesState);

    await tester.pumpWidget(testWidget);
  }

  testWidgets(
    'Deve renderizar o MoviesPage corretamente',
    (tester) async {
      await mockStates(tester);

      await tester.pumpWidget(testWidget);

      expect(find.byType(MoviesPage), findsOneWidget);
    },
  );

  testWidgets(
    'Deve renderizar o AppBar da MoviesPage corretamente',
    (tester) async {
      await mockNetworkImagesFor(() async {
        await mockStates(tester);

        final appBar = find.byKey(
          const Key(keyMoviesListAppBar),
        );

        expect(appBar, findsOneWidget);
      });
    },
  );

  testWidgets(
    ''' Quando o usecase for sucedido:
    1) Inicia a tela mostrando um CircularProgress Indicator.
    2) Mostra a lista de filmes
    ''',
    (tester) async {
      when(moviesViewModel.fetch()).thenAnswer((_) async {
        moviesState.loading = true;
        await Future.delayed(const Duration(seconds: 1));
        moviesState.value = [
          MovieSample.create(),
        ];
        moviesState.loading = false;
      });

      await mockNetworkImagesFor(() async {
        await mockStates(tester);

        verify(moviesViewModel.fetch()).called(1);

        final circularProgressIndicator = find.byKey(
          const Key(keyMoviesCicularProgressIndicator),
        );

        expect(circularProgressIndicator, findsOneWidget);

        await tester.pumpAndSettle();

        final movies = find.byKey(const Key(keyMoviesList));

        expect(movies, findsOneWidget);
      });
    },
  );
}
