import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/features/login/presentation/login_page/viewmodel/login_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocks/mocks.mocks.dart';
import '../../../domain/samples/login_request_sample.dart';
import '../../../domain/samples/user_info_sample.dart';

void main() {
  late LoginViewModel viewModel;
  late MockDoLoginUsecaseInterface doLoginUsecase;

  setUp(() {
    doLoginUsecase = MockDoLoginUsecaseInterface();
    viewModel = LoginViewModel(doLoginUsecase: doLoginUsecase);
  });

  group('doLogin', () {
    test('should update loginViewState with Result.success and UserInfo ',
        () async {
      final userInfo = UserInfoSample.create();
      when(doLoginUsecase(loginRequest: anyNamed('loginRequest')))
          .thenAnswer((_) async => Result.success(userInfo));

      await viewModel.doLogin(LoginRequestSample.create());

      expect(viewModel.loginViewState.value, userInfo);
    });

    test('should update loginViewState with Result.failure and Failure ',
        () async {
      const failure = Failure();
      when(doLoginUsecase(loginRequest: anyNamed('loginRequest')))
          .thenAnswer((_) async => const Result.failure(failure));

      await viewModel.doLogin(LoginRequestSample.create());

      expect(viewModel.loginViewState.error, failure);
    });
  });

  group('cleanViewState', () {
    test('should clean loginViewState', () async {
      viewModel.loginViewState.value = UserInfoSample.create();

      viewModel.cleanViewState();

      expect(viewModel.loginViewState.value, null);
    });
  });
}
