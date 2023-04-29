import 'dart:convert';

EditSuccessResponseModel editSuccessResponseModelFromJson(String str) =>
    EditSuccessResponseModel.fromJson(json.decode(str));

String editSuccessResponseModelToJson(EditSuccessResponseModel data) =>
    json.encode(data.toJson());

class EditSuccessResponseModel {
  bool status;
  String message;
  int code;

  EditSuccessResponseModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory EditSuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      EditSuccessResponseModel(
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
