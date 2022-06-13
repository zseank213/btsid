import 'package:dio/dio.dart';
import 'package:btsid/lib.dart';

class LoginService {
  final Dio _dio = Dio();

  LoginService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> getLoginToken({required AuthLoginModel data}) async {
    _dio.options.baseUrl = baseUrl;

    try {
      var response = await _dio.post(
        apiLogin,
        data: {
          "username": data.username,
          "password": data.password,
        },
      );
      return response;
    } on DioError catch (e) {
      return dioCatchError(e);
    }
  }
}
