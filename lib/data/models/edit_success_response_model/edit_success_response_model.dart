// To parse this JSON data, do
//
//     final editSuccessResponseModel = editSuccessResponseModelFromJson(jsonString);

import 'dart:convert';

EditSuccessResponseModel editSuccessResponseModelFromJson(String str) => EditSuccessResponseModel.fromJson(json.decode(str));

String editSuccessResponseModelToJson(EditSuccessResponseModel data) => json.encode(data.toJson());

class EditSuccessResponseModel {
  EditSuccessResponseModel({
    required this.status,
    required this.message,
    required this.code,
  });

  bool status;
  String message;
  int code;

  factory EditSuccessResponseModel.fromJson(Map<String, dynamic> json) => EditSuccessResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
  };
}
