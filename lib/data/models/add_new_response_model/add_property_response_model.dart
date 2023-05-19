import 'dart:convert';

AddPropertyResponseModel addPropertyResponseModelFromJson(String str) =>
    AddPropertyResponseModel.fromJson(json.decode(str));

String addPropertyResponseModelToJson(AddPropertyResponseModel data) =>
    json.encode(data.toJson());

class AddPropertyResponseModel {
  bool status;
  String msg;
  int propertyId;
  int code;

  AddPropertyResponseModel({
    required this.status,
    required this.msg,
    required this.propertyId,
    required this.code,
  });

  factory AddPropertyResponseModel.fromJson(Map<String, dynamic> json) =>
      AddPropertyResponseModel(
        status: json["status"],
        msg: json["msg"],
        propertyId: json["Property_id"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "Property_id": propertyId,
        "code": code,
      };
}
