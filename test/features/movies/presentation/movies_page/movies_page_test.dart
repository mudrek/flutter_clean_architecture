import 'package:flutter/material.dart';
import 'package:flutter_clean_next/core/constants/keys.dart';
import 'package:flutter_clean_next/core/foundation/data/failure.dart';
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
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    moviesState = ViewState<List<Movie>>()..loading = false;

    moviesViewModel = MockMoviesViewModel();
    get.registerFactory<MoviesViewModel>(
      () => moviesViewModel,
    );

    mockNavigatorObserver = MockNavigatorObserver();

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

  testWidgets('''
    Quando o viewModel lançar uma Failure:
    1) Mostra a mensagem de erro na tela.
    ''', (tester) async {
    //Arrange
    when(moviesViewModel.fetch()).thenAnswer((_) async {
      moviesState.error = const Failure();
    });

    await mockNetworkImagesFor(() async {
      when(moviesViewModel.moviesState).thenReturn(moviesState);

      await mockStates(tester);

      verify(moviesViewModel.fetch()).called(1);

      final errorText = find.byKey(const Key(keyMoviesErrorText));

      expect(errorText, findsOneWidget);
    });
  });

  testWidgets(
      'deve efetuar um push, para a tela de detalhes do filme, ao clicar em um filme',
      (tester) async {
    when(moviesViewModel.moviesState).thenReturn(moviesState);
    when(moviesViewModel.fetch()).thenAnswer((_) async {
      moviesState.value = [
        MovieSample.create(),
      ];
    });

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MoviesPage(),
          navigatorObservers: [mockNavigatorObserver],
        ),
      );

      verify(moviesViewModel.fetch()).called(1);

      final listTile = find.byKey(const Key('movieTile'));
      expect(listTile, findsOneWidget);

      await tester.tap(listTile);

      await tester.pumpAndSettle();

      verify(mockNavigatorObserver.didPush(any, any));
    });
  });
}
