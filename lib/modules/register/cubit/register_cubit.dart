import 'package:btsid/modules/register/model/auth_register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:btsid/lib.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final RegisterService _registerService = RegisterService();

  void getAuthRegister({required AuthRegisterModel data}) async {
    emit(OnLoadingGetAuthRegister());

    try {
      var res = await _registerService.getRegister(
        data: AuthRegisterModel(
          username: data.username,
          password: data.password,
          email: data.email,
        ),
      );
      if (res.statusCode == 200) {
        try {
          var _data = DataRegister.fromJson(res.data);
          debugPrint('Get Auth Status : Success');
          emit(OnSuccessGetAuthRegister(data: _data));
        } catch (e) {
          debugPrint('Get Auth Status ${e.toString()}');
          emit(OnErrorGetAuthRegister(errorCode: res.statusCode, errorMessage: e.toString()));
        }
      } else {
        debugPrint('Get Auth Status : ${res.toString()}');
        emit(OnErrorGetAuthRegister(errorCode: res.statusCode, errorMessage: res.toString()));
      }
    } catch (e) {
      debugPrint('Get Auth Status : ${e.toString()}');

      emit(OnErrorGetAuthRegister(errorCode: 500, errorMessage: e.toString()));
    }
  }
}
