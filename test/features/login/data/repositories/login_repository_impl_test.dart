import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/core/foundation/failures/failures.dart';
import 'package:flutter_clean_next/features/login/data/datasources/login_datasource_interface.dart';
import 'package:flutter_clean_next/features/login/data/handlers/login_exception_handler.dart';
import 'package:flutter_clean_next/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_next/features/login/domain/entities/user_info.dart';
import 'package:flutter_clean_next/features/login/domain/repositories/login_repository_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../../domain/samples/login_request_sample.dart';
import '../../domain/samples/user_info_sample.dart';
import '../samples/login_request_model_sample.dart';
import '../samples/user_info_model_sample.dart';

void main() {
  late LoginRepositoryInterface sut;

  late LoginDatasourceInterface loginDatasource;
  late LoginExceptionHandler exceptionHandler;

  setUp(() {
    loginDatasource = MockLoginDatasourceInterface();
    exceptionHandler = MockLoginExceptionHandler();

    sut = LoginRepositoryImpl(
      loginDatasource: loginDatasource,
      exceptionHandler: exceptionHandler,
    );
  });

  test(
    'should return Result.success with UserInfo when datasource called successfully',
    () async {
      final loginRequest = LoginRequestSample.create();
      final loginRequestModel = LoginRequestModelSample.create();
      final userInfo = UserInfoModelSample.create();
      final response = Result.success(UserInfoSample.create());

      when(
        loginDatasource.doLogin(
          loginRequest: loginRequestModel,
        ),
      ).thenAnswer((_) async => Future.value(userInfo));

      final result = await sut.doLogin(loginRequest: loginRequest);

      expect(result, response);
    },
  );

  test(
    'should return Result.error when datasource called with error',
    () async {
      final loginRequest = LoginRequestSample.create();
      final loginRequestModel = LoginRequestModelSample.create();
      final response = Result<UserInfo>.failure(GenericFailure());

      when(
        loginDatasource.doLogin(
          loginRequest: loginRequestModel,
        ),
      ).thenThrow(Exception('error'));

      final result = await sut.doLogin(loginRequest: loginRequest);

      expect(result, response);
    },
  );
}
