import 'package:flutter_clean_next/features/login/domain/entities/user_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../samples/user_info_sample.dart';

void main() {
  late UserInfo userInfo;

  setUp(() {
    userInfo = UserInfoSample.create();
  });

  test('should return a valid LoginRequest', () {
    expect(userInfo.id, 1);
    expect(userInfo.name, 'name');
    expect(userInfo.email, 'email@email.com');
    expect(userInfo.photoUrl, 'photoUrl');
  });

  test('should validate LoginRequestModel equatable', () {
    const userInfo2 = UserInfo(
      id: 1,
      name: 'name',
      email: 'email@email.com',
      photoUrl: 'photoUrl',
    );

    expect(userInfo, userInfo2);
  });
}
