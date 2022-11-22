import 'package:dio/dio.dart';
import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/features/login/data/handlers/login_exception_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginExceptionHandler loginExceptionHandler;

  setUp(() {
    loginExceptionHandler = LoginExceptionHandler();
  });

  test(
    'should return Failure with error message from response when DioError statusCode == 401',
    () async {
      const failureExpected = Failure(
        message: 'Ocorreu um erro',
      );

      final dioError = DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          statusCode: 401,
          data: {'error': 'Ocorreu um erro'},
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = loginExceptionHandler.handle(dioError);

      expect(result, failureExpected);
    },
  );

  test(
    'should throw DioError when DioError statusCode != 401',
    () async {
      final dioError = DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          statusCode: 400,
          data: {'error': 'Ocorreu um erro'},
          requestOptions: RequestOptions(path: ''),
        ),
      );

      expect(
        () => loginExceptionHandler.handle(dioError),
        throwsA(dioError),
      );
    },
  );

  test(
    'should return Failure with generic message when any other error',
    () async {
      const failureExpected = Failure(
        message: 'Ocorrou um erro, favor tente novamente mais tarde',
      );

      final result = loginExceptionHandler.handle(Exception());

      expect(result, failureExpected);
    },
  );
}
