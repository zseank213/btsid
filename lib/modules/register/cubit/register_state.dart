part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class OnLoadingGetAuthRegister extends RegisterState {}

class OnErrorGetAuthRegister extends RegisterState {
  final int? errorCode;
  final String? errorMessage;

  OnErrorGetAuthRegister({this.errorCode, this.errorMessage});
}

class OnSuccessGetAuthRegister extends RegisterState {
  final DataRegister? data;

  OnSuccessGetAuthRegister({this.data});
}
