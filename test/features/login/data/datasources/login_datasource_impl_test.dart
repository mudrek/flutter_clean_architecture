import 'package:dio/dio.dart';
import 'package:flutter_clean_next/features/login/data/datasources/login_datasource_impl.dart';
import 'package:flutter_clean_next/features/login/data/datasources/login_datasource_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../samples/login_request_model_sample.dart';
import '../samples/user_info_model_sample.dart';

void main() {
  late LoginDatasourceInterface sut;
  late MockDio dio;

  setUp(() {
    dio = MockDio();
    sut = LoginDatasourceImpl(dio: dio);
  });

  void mockQuerySuccess() {
    final result = UserInfoModelSample.createMap();

    when(
      dio.post(
        any,
        data: anyNamed('data'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: result,
        requestOptions: RequestOptions(
          path: 'https://carros-springboot.herokuapp.com/api/v2/login',
        ),
      ),
    );
  }

  void mockQueryFailure() {
    final result = {
      'error': 'Backend error',
    };

    when(
      dio.post(
        any,
        data: anyNamed('data'),
      ),
    ).thenThrow(
      Exception(result['error']),
    );
  }

  test('Should return a user info when the response code equals 200 (success)',
      () async {
    mockQuerySuccess();
    final response = UserInfoModelSample.create();

    final result =
        await sut.doLogin(loginRequest: LoginRequestModelSample.create());

    expect(result, response);
    verify(
      dio.post(
        'https://carros-springboot.herokuapp.com/api/v2/login',
        data: LoginRequestModelSample.createMap(),
      ),
    ).called(1);
  });

  test('Should throw an exception when the response code is different from 200',
      () async {
    mockQueryFailure();

    expect(
      () async =>
          await sut.doLogin(loginRequest: LoginRequestModelSample.create()),
      throwsA(isA<Exception>()),
    );
    verify(
      dio.post(
        'https://carros-springboot.herokuapp.com/api/v2/login',
        data: LoginRequestModelSample.createMap(),
      ),
    ).called(1);
  });
}
