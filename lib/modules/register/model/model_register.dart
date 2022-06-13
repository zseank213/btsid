// To parse this JSON data, do
//
//     final dataRegister = dataRegisterFromJson(jsonString);

import 'dart:convert';

DataRegister dataRegisterFromJson(String str) => DataRegister.fromJson(json.decode(str));

String dataRegisterToJson(DataRegister data) => json.encode(data.toJson());

class DataRegister {
  DataRegister({
    this.statusCode,
    this.message,
    this.errorMessage,
    this.data,
  });

  int? statusCode;
  String? message;
  dynamic errorMessage;
  dynamic data;

  factory DataRegister.fromJson(Map<String, dynamic> json) => DataRegister(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "errorMessage": errorMessage,
        "data": data,
      };
}
