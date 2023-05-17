import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) =>
    json.encode(data.toJson());

class RegisterResponseModel {
  bool status;
  String msg;
  int ownerId;
  String ownerEmail;
  int code;

  RegisterResponseModel({
    required this.status,
    required this.msg,
    required this.ownerId,
    required this.ownerEmail,
    required this.code,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        status: json["status"],
        msg: json["msg"],
        ownerId: json["owner_id"],
        ownerEmail: json["owner_email"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "owner_id": ownerId,
        "owner_email": ownerEmail,
        "code": code,
      };
}
