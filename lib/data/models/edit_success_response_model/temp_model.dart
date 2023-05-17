// To parse this JSON data, do
//
//     final uploadResponseModel = uploadResponseModelFromJson(jsonString);

import 'dart:convert';

UploadResponseModel uploadResponseModelFromJson(String str) =>
    UploadResponseModel.fromJson(json.decode(str));

String uploadResponseModelToJson(UploadResponseModel data) =>
    json.encode(data.toJson());

class UploadResponseModel {
  bool status;
  String message;
  int code;

  UploadResponseModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory UploadResponseModel.fromJson(Map<String, dynamic> json) =>
      UploadResponseModel(
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
