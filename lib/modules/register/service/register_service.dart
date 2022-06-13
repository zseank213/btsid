import 'package:dio/dio.dart';
import 'package:btsid/lib.dart';

class RegisterService {
  final Dio _dio = Dio();

  RegisterService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> getRegister({required AuthRegisterModel data}) async {
    _dio.options.baseUrl = baseUrl;

    try {
      var response = await _dio.post(
        apiRegister,
        data: {
          "username": data.username,
          "password": data.password,
          "email": data.email,
        },
      );
      return response;
    } on DioError catch (e) {
      return dioCatchError(e);
    }
  }
}
