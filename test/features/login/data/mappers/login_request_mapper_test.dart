import 'package:flutter_clean_next/features/login/data/mappers/login_request_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/samples/login_request_sample.dart';
import '../samples/login_request_model_sample.dart';

void main() {
  test('should convert LoginRequest to LoginRequestModel', () {
    final entity = LoginRequestSample.create();
    final model = LoginRequestModelSample.create();

    final result = LoginRequestMapper.toModel(entity);

    expect(result, model);
  });
}
