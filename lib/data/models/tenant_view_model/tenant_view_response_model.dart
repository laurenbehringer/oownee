// To parse this JSON data, do
//
//     final tenantViewResponseModel = tenantViewResponseModelFromJson(jsonString);

import 'dart:convert';

TenantViewResponseModel tenantViewResponseModelFromJson(String str) =>
    TenantViewResponseModel.fromJson(json.decode(str));

String tenantViewResponseModelToJson(TenantViewResponseModel data) =>
    json.encode(data.toJson());

class TenantViewResponseModel {
  TenantViewResponseModel({
    required this.status,
    required this.data,
    required this.code,
  });

  bool status;
  Data data;
  int code;

  factory TenantViewResponseModel.fromJson(Map<String, dynamic> json) =>
      TenantViewResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "code": code,
      };
}

class Data {
  Data({
    required this.id,
    required this.tenantName,
    required this.phoneNumber,
    required this.tenantRent,
    required this.tenantBirthdate,
    required this.tenantDoc,
    required this.tenantImage,
    required this.propertyId,
    required this.tenantCountry,
    required this.date,
    required this.tenantEmail,
    required this.tenantBankAccNo,
    required this.propertyName,
    required this.propertyType,
    required this.propertyAddress,
    required this.monthlyRent,
  });

  String id;
  String tenantName;
  String phoneNumber;
  String tenantRent;
  String tenantBirthdate;
  String tenantDoc;
  String tenantImage;
  String propertyId;
  String tenantCountry;
  String date;
  String tenantEmail;
  String tenantBankAccNo;
  String propertyName;
  String propertyType;
  String propertyAddress;
  String monthlyRent;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        tenantName: json["tenant_name"],
        phoneNumber: json["phone_number"],
        tenantRent: json["tenant_rent"],
        tenantBirthdate: json["tenant_birthdate"],
        tenantDoc: json["tenant_doc"],
        tenantImage: json["tenant_image"],
        propertyId: json["property_id"],
        tenantCountry: json["tenant_country"],
        date: json["date"],
        tenantEmail: json["tenant_email"],
        tenantBankAccNo: json["tenant_bank_acc_no"],
        propertyName: json["property_name"],
        propertyType: json["property_type"],
        propertyAddress: json["property_address"],
        monthlyRent: json["monthly_rent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tenant_name": tenantName,
        "phone_number": phoneNumber,
        "tenant_rent": tenantRent,
        "tenant_birthdate": tenantBirthdate,
        "tenant_doc": tenantDoc,
        "tenant_image": tenantImage,
        "property_id": propertyId,
        "tenant_country": tenantCountry,
        "date": date,
        "tenant_email": tenantEmail,
        "tenant_bank_acc_no": tenantBankAccNo,
        "property_name": propertyName,
        "property_type": propertyType,
        "property_address": propertyAddress,
        "monthly_rent": monthlyRent,
      };
}
