import 'package:flutter_clean_next/features/login/domain/entities/login_request.dart';

extension LoginRequestSample on LoginRequest {
  static LoginRequest create({
    String username = 'username',
    String password = 'password',
  }) =>
      LoginRequest(username: username, password: password);
}
