import 'package:dio/dio.dart';
import 'package:flutter_clean_next/core/foundation/base_repository/base_repository.dart';
import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/core/foundation/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.mocks.dart';

class TestBaseRepository extends BaseRepository<MockBaseExceptionHandler> {
  TestBaseRepository({
    MockBaseExceptionHandler? exceptionHandler,
  }) : super(exceptionHandler: exceptionHandler);
}

void main() {
  late TestBaseRepository baseRepository;

  setUp(() {
    baseRepository = TestBaseRepository();
  });

  Future<String> task() async => 'Teste';

  test('Should return Result.success when exec string value', () async {
    const resultSuccess = Result.success('Teste');
    final success = await baseRepository.exec(task);

    expect(resultSuccess, success);
  });

  test(
      'Should return Result.failure TimeoutFailure when throw DioError type connectTimeout',
      () async {
    const resultFailure = Result<dynamic>.failure(TimeoutFailure());
    final response = await baseRepository.exec(
      () => throw DioError(
        requestOptions: RequestOptions(path: 'test'),
        type: DioErrorType.connectTimeout,
        error: 'error',
      ),
    );

    expect(resultFailure.error, response.error);
  });

  test(
      'Should return Result.failure GenericFailure when throw DioError type other',
      () async {
    final resultFailure = Result<dynamic>.failure(GenericFailure());
    final response = await baseRepository.exec(
      () => throw DioError(
        requestOptions: RequestOptions(path: 'test'),
        type: DioErrorType.other,
        error: 'error',
      ),
    );

    expect(resultFailure.error, response.error);
  });

  test('Should return Result.failure GenericFailure when throw Exception',
      () async {
    final resultFailure = Result<dynamic>.failure(GenericFailure());
    final response = await baseRepository.exec(
      () => throw Exception(),
    );

    expect(resultFailure.error, response.error);
  });
}
