import 'package:flutter_clean_next/features/login/data/mappers/user_info_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/samples/user_info_sample.dart';
import '../samples/user_info_model_sample.dart';

void main() {
  test('should convert UserInfoModel to UserInfo', () {
    final entity = UserInfoSample.create();
    final model = UserInfoModelSample.create();

    final result = UserInfoMapper.toEntity(model);

    expect(result, entity);
  });
}
