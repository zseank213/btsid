import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:btsid/lib.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginService _loginService = LoginService();

  void getAuth({required AuthLoginModel data}) async {
    emit(OnLoadingGetAuthLogin());

    try {
      var res = await _loginService.getLoginToken(
        data: AuthLoginModel(
          username: data.username,
          password: data.password,
        ),
      );
      if (res.statusCode == 200) {
        try {
          var _data = DataLogin.fromJson(res.data);
          debugPrint('Get Auth Status : Success');
          await SecureStorage.setAccessToken(accessToken: _data.data?.token ?? "");
          emit(OnSuccessGetAuthLogin(data: _data));
        } catch (e) {
          debugPrint('Get Auth Status ${e.toString()}');
          emit(OnErrorGetAuthLogin(errorCode: res.statusCode, errorMessage: res.statusMessage));
        }
      } else {
        debugPrint('Get Auth Status : ${res.toString()}');
        emit(OnErrorGetAuthLogin(errorCode: res.statusCode, errorMessage: res.toString()));
      }
    } catch (e) {
      debugPrint('Get Auth Status : ${e.toString()}');

      emit(OnErrorGetAuthLogin(errorCode: 500, errorMessage: e.toString()));
    }
  }
}
