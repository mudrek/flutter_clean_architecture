import 'package:flutter_clean_next/features/login/data/models/user_info_model.dart';

extension UserInfoModelSample on UserInfoModel {
  static UserInfoModel create({
    int id = 1,
    String name = 'name',
    String email = 'email@email.com',
    String photoUrl = 'photoUrl',
  }) =>
      UserInfoModel(id: id, name: name, photoUrl: photoUrl, email: email);

  static Map<String, dynamic> createMap() => {
        'id': 1,
        'nome': 'name',
        'email': 'email@email.com',
        'urlFoto': 'photoUrl',
      };
}
