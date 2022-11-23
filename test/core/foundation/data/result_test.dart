import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/core/foundation/data/result.dart';
import 'package:flutter_clean_next/core/foundation/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.dart';

void main() {
  const data = true;
  const resultSuccess = Result.success(data);
  const tFailure = TimeoutFailure();
  const tResultFailure = Result.failure(tFailure);

  group('when', () {
    late MockFunction<dynamic, void> success;
    late MockFunction<Failure, void> failure;

    setUp(() {
      success = MockFunction();
      failure = MockFunction();
    });

    test(
      'should call the success statement when the Result is success',
      () async {
        // act
        resultSuccess.when(success: success, failure: failure);

        // assert
        verify(success(data));
        verifyNever(failure(any));
      },
    );
    test(
      'should call the failure statement when the Result is failure',
      () async {
        // act
        tResultFailure.when(success: success, failure: failure);

        // assert
        verifyNever(success(any));
        verify(failure(tFailure));
      },
    );
  });
}
