import 'package:flutter_test/flutter_test.dart';

import '../samples/login_request_model_sample.dart';

void main() {
  test('should return a valid LoginRequestModel', () {
    final loginRequestModel = LoginRequestModelSample.create();

    expect(loginRequestModel.username, 'username');
    expect(loginRequestModel.password, 'password');
  });

  test('should return a valid json when toJson was called', () {
    final loginRequestModel = LoginRequestModelSample.create();
    final loginRequestMap = LoginRequestModelSample.createMap();

    final result = loginRequestModel.toJson();

    expect(result, loginRequestMap);
  });
}
