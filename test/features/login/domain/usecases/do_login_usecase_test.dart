import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/features/login/domain/entities/user_info.dart';
import 'package:flutter_clean_next/features/login/domain/usecases/do_login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../samples/login_request_sample.dart';
import '../samples/user_info_sample.dart';

void main() {
  late DoLoginUsecaseImpl usecaseLogin;
  late MockLoginRepositoryInterface repository;

  setUp(() {
    repository = MockLoginRepositoryInterface();
    usecaseLogin = DoLoginUsecaseImpl(loginRepository: repository);
  });

  group('DoLoginUsecaseImpl', () {
    test(
      'should return a Result.success when repository is success',
      () async {
        final response = Result.success(UserInfoSample.create());

        final model = LoginRequestSample.create();

        when(
          repository.doLogin(loginRequest: model),
        ).thenAnswer((_) async => response);

        final result = await usecaseLogin(loginRequest: model);

        expect(result, response);
        verify(
          repository.doLogin(loginRequest: model),
        );
      },
    );

    test(
        'should return a Result.failure when the repository returns some Failure',
        () async {
      const response = Result<UserInfo>.failure(Failure());

      final model = LoginRequestSample.create(password: '1');

      when(
        repository.doLogin(loginRequest: model),
      ).thenAnswer((_) async => response);

      final result = await usecaseLogin(loginRequest: model);

      expect(result, response);
      verify(
        repository.doLogin(loginRequest: model),
      );
    });
  });
}
