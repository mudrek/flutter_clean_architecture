import 'package:flutter_clean_next/core/foundation/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MessageFailure', () {
    const failure = MessageFailure('Você está sem internet, tente novamente.');
    expect(failure, isA<MessageFailure>());
    expect(failure.msg, 'Você está sem internet, tente novamente.');
  });
}
