import 'package:flutter_clean_next/features/login/domain/entities/user_info.dart';

extension UserInfoSample on UserInfo {
  static UserInfo create({
    int id = 1,
    String name = 'name',
    String email = 'email@email.com',
    String photoUrl = 'photoUrl',
  }) =>
      UserInfo(id: id, name: name, photoUrl: photoUrl, email: email);
}
