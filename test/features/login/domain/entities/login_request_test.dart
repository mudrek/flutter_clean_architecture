import 'package:flutter_clean_next/features/login/domain/entities/login_request.dart';
import 'package:flutter_test/flutter_test.dart';

import '../samples/login_request_sample.dart';

void main() {
  late LoginRequest loginRequest;

  setUp(() {
    loginRequest = LoginRequestSample.create();
  });

  test('should return a valid LoginRequest', () {
    expect(loginRequest.username, 'username');
    expect(loginRequest.password, 'password');
  });

  test('should validate LoginRequestModel equatable', () {
    const loginRequest2 = LoginRequest(
      username: 'username',
      password: 'password',
    );

    expect(loginRequest, loginRequest2);
  });
}
