import 'package:flutter/material.dart';
import 'package:flutter_clean_next/core/constants/keys.dart';
import 'package:flutter_clean_next/core/foundation/failures/failures.dart';
import 'package:flutter_clean_next/core/foundation/injector/get.dart';
import 'package:flutter_clean_next/core/foundation/states/state.dart';
import 'package:flutter_clean_next/features/login/domain/entities/user_info.dart';
import 'package:flutter_clean_next/features/login/domain/validators/login_validators_impl.dart';
import 'package:flutter_clean_next/features/login/presentation/login_page/login_page.dart';
import 'package:flutter_clean_next/features/login/presentation/login_page/validators/login_validators_interface.dart';
import 'package:flutter_clean_next/features/login/presentation/login_page/viewmodel/login_view_model.dart';
import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart';
import 'package:flutter_clean_next/features/movies/presentation/movies_page/viewmodels/movies_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../../domain/samples/user_info_sample.dart';

void main() {
  late Widget testWidget;
  late MockLoginViewModel viewModel;
  late ViewState<UserInfo> loginViewState;
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    loginViewState = ViewState<UserInfo>()..loading = false;

    viewModel = MockLoginViewModel();
    mockNavigatorObserver = MockNavigatorObserver();

    get.registerFactory<LoginViewModel>(
      () => viewModel,
    );
    get.registerFactory<LoginValidatorsInterface>(
      () => LoginValidatorsImpl(),
    );

    testWidget = const MaterialApp(
      home: LoginPage(),
    );
  });

  tearDown(() {
    get.unregister<LoginViewModel>();
    get.unregister<LoginValidatorsInterface>();
  });

  Future<void> mockStates(tester) async {
    when(viewModel.loginViewState).thenReturn(loginViewState);

    await tester.pumpWidget(testWidget);
  }

  testWidgets('should render LoginPage', (tester) async {
    await mockStates(tester);

    await tester.pumpWidget(testWidget);

    expect(find.byType(LoginPage), findsOneWidget);
  });

  void successfulMock() {
    when(viewModel.doLogin(any)).thenAnswer((_) async {
      loginViewState.loading = true;
      await Future.delayed(const Duration(seconds: 1));
      loginViewState.value = UserInfoSample.create();
    });
  }

  testWidgets(
    ''' When usecase is successfull:
    1) Show CircularProgress Indicator in button.
    2) Show dialog with success message.
    ''',
    (tester) async {
      await mockStates(tester);
      successfulMock();

      final usernameTextField = find.byKey(const Key(keyTextFormFieldUsername));
      final passwordTextField = find.byKey(const Key(keyTextFormFieldPassword));

      await tester.enterText(usernameTextField, 'username');
      await tester.enterText(passwordTextField, 'password');

      await tester.tap(find.byKey(const Key(keyButtonLogin)));

      await tester.pump();

      expect(
        find.byKey(const Key(keyLoginCircularProgressIndicator)),
        findsOneWidget,
      );

      loginViewState.loading = false;

      await tester.pumpFrames(testWidget, const Duration(seconds: 2));

      expect(find.byKey(const Key(keyLoginAlert)), findsOneWidget);
      expect(
        find.byKey(const Key(keyLoginCircularProgressIndicator)),
        findsNothing,
      );
    },
  );

  testWidgets(
    ''' When usecase is unsuccessfull:
    1) Show CircularProgress Indicator in button.
    2) Show snackBar with error message.
    ''',
    (tester) async {
      when(viewModel.doLogin(any)).thenAnswer((_) async {
        loginViewState.loading = true;
        await Future.delayed(const Duration(seconds: 1));
        loginViewState.error = GenericFailure();
      });

      await mockStates(tester);

      final usernameTextField = find.byKey(const Key(keyTextFormFieldUsername));
      final passwordTextField = find.byKey(const Key(keyTextFormFieldPassword));

      await tester.enterText(usernameTextField, 'username');
      await tester.enterText(passwordTextField, 'password');

      await tester.tap(find.byKey(const Key(keyButtonLogin)));

      await tester.pump();

      expect(
        find.byKey(const Key(keyLoginCircularProgressIndicator)),
        findsOneWidget,
      );

      loginViewState.loading = false;

      await tester.pumpFrames(testWidget, const Duration(seconds: 2));

      expect(find.byKey(const Key(keyScaffolMessage)), findsOneWidget);
      expect(
        find.byKey(const Key(keyLoginCircularProgressIndicator)),
        findsNothing,
      );
    },
  );

  group('push to Movies', () {
    late MoviesViewModel moviesViewModel;
    late ViewState<List<Movie>> moviesState;

    setUp(() {
      moviesState = ViewState<List<Movie>>()..loading = false;

      moviesViewModel = MockMoviesViewModel();
      get.registerFactory<MoviesViewModel>(
        () => moviesViewModel,
      );
    });

    Future<void> mockMoviesStates() async {
      when(moviesViewModel.moviesState).thenReturn(moviesState);
    }

    tearDown(() {
      get.unregister<MoviesViewModel>();
    });

    testWidgets(
        'shoud make a push to MoviesPage when button clicked after login succeeded',
        (tester) async {
      when(viewModel.loginViewState).thenReturn(loginViewState);
      mockMoviesStates();
      successfulMock();

      await tester.pumpWidget(
        MaterialApp(
          home: const LoginPage(),
          navigatorObservers: [mockNavigatorObserver],
        ),
      );

      final usernameTextField = find.byKey(const Key(keyTextFormFieldUsername));
      final passwordTextField = find.byKey(const Key(keyTextFormFieldPassword));

      await tester.enterText(usernameTextField, 'username');
      await tester.enterText(passwordTextField, 'password');

      await tester.tap(find.byKey(const Key(keyButtonLogin)));

      await tester.pump();

      loginViewState.loading = false;

      await tester.pumpFrames(testWidget, const Duration(seconds: 2));

      expect(find.byKey(const Key(keyLoginAlert)), findsOneWidget);
      expect(
        find.byKey(const Key(keyLoginCircularProgressIndicator)),
        findsNothing,
      );

      await tester.tap(find.byKey(const Key(keyLoginAlertButton)));

      await tester.pumpAndSettle();

      verify(
        mockNavigatorObserver.didPush(
          any,
          any,
        ),
      );
    });
  });
}
