import 'package:flutter_clean_next/features/login/data/models/login_request_model.dart';

extension LoginRequestModelSample on LoginRequestModel {
  static LoginRequestModel create({
    String username = 'username',
    String password = 'password',
  }) =>
      LoginRequestModel(username: username, password: password);

  static Map<String, dynamic> createMap() => {
        'username': 'username',
        'password': 'password',
      };
}
