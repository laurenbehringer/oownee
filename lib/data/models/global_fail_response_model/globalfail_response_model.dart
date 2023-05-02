import 'dart:convert';

GlobalFailedResponseModel globalFailedResponseModelFromJson(String str) =>
    GlobalFailedResponseModel.fromJson(json.decode(str));

String globalFailedResponseModelToJson(GlobalFailedResponseModel data) =>
    json.encode(data.toJson());

class GlobalFailedResponseModel {
  String status;
  String message;
  int code;

  GlobalFailedResponseModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory GlobalFailedResponseModel.fromJson(Map<String, dynamic> json) =>
      GlobalFailedResponseModel(
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
