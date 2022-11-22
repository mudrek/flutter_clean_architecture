import 'package:flutter_clean_next/features/login/data/models/user_info_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../samples/user_info_model_sample.dart';

void main() {
  test('should return a valid UserInfoModel', () {
    final userInfoModel = UserInfoModelSample.create();

    expect(userInfoModel.id, 1);
    expect(userInfoModel.name, 'name');
    expect(userInfoModel.email, 'email@email.com');
    expect(userInfoModel.photoUrl, 'photoUrl');
  });

  test('should return a valid UserInfoModel from json', () {
    final userInfoModel = UserInfoModelSample.create();
    final userMap = UserInfoModelSample.createMap();

    final result = UserInfoModel.fromJson(userMap);

    expect(result, userInfoModel);
  });
}
