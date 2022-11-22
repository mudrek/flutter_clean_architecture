import 'package:dio/dio.dart';

import '../models/login_request_model.dart';
import '../models/user_info_model.dart';
import 'login_datasource_interface.dart';

class LoginDatasourceImpl implements LoginDatasourceInterface {
  final Dio dio;

  LoginDatasourceImpl({required this.dio});

  @override
  Future<UserInfoModel> doLogin({
    required LoginRequestModel loginRequest,
  }) async {
    final response = await dio.post(
      'https://carros-springboot.herokuapp.com/api/v2/login',
      data: loginRequest.toJson(),
    );
    return UserInfoModel.fromJson(response.data);
  }
}
