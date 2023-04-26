import 'dart:convert';

OwnerEditResponseModel ownerEditResponseModelFromJson(String str) =>
    OwnerEditResponseModel.fromJson(json.decode(str));

String ownerEditResponseModelToJson(OwnerEditResponseModel data) =>
    json.encode(data.toJson());

class OwnerEditResponseModel {
  OwnerEditResponseModel({
    required this.status,
    required this.message,
    required this.code,
  });

  bool status;
  String message;
  int code;

  factory OwnerEditResponseModel.fromJson(Map<String, dynamic> json) =>
      OwnerEditResponseModel(
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
