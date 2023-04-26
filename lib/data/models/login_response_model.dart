import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
  });

  String id;
  String email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
      };
}
