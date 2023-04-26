// To parse this JSON data, do
//
//     final dashboardResponseModel = dashboardResponseModelFromJson(jsonString);

import 'dart:convert';

DashboardResponseModel dashboardResponseModelFromJson(String str) =>
    DashboardResponseModel.fromJson(json.decode(str));

String dashboardResponseModelToJson(DashboardResponseModel data) =>
    json.encode(data.toJson());

class DashboardResponseModel {
  DashboardResponseModel({
    required this.status,
    required this.owner,
    required this.propertyDetails,
    required this.code,
  });

  bool status;
  Owner owner;
  List<PropertyDetail> propertyDetails;
  int code;

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      DashboardResponseModel(
        status: json["status"],
        owner: Owner.fromJson(json["owner"]),
        propertyDetails: List<PropertyDetail>.from(
            json["property_details"].map((x) => PropertyDetail.fromJson(x))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "owner": owner.toJson(),
        "property_details":
            List<dynamic>.from(propertyDetails.map((x) => x.toJson())),
        "code": code,
      };
}

class Owner {
  Owner({
    required this.ownerName,
    required this.ownerImage,
    required this.properties,
    required this.tenants,
    required this.monthlyRentIncome,
    required this.yearlyRentIncome,
  });

  String ownerName;
  String ownerImage;
  int properties;
  int tenants;
  int monthlyRentIncome;
  int yearlyRentIncome;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        ownerName: json["owner_name"],
        ownerImage: json["owner_image"],
        properties: json["properties"],
        tenants: json["tenants"],
        monthlyRentIncome: json["monthly_rent_income"],
        yearlyRentIncome: json["yearly_rent_income"],
      );

  Map<String, dynamic> toJson() => {
        "owner_name": ownerName,
        "owner_image": ownerImage,
        "properties": properties,
        "tenants": tenants,
        "monthly_rent_income": monthlyRentIncome,
        "yearly_rent_income": yearlyRentIncome,
      };
}

class PropertyDetail {
  PropertyDetail({
    required this.propertyId,
    required this.propertyName,
    required this.numberOfTenants,
    required this.propertyIamge,
    required this.tenants,
  });

  String propertyId;
  String propertyName;
  String numberOfTenants;
  String propertyIamge;
  List<Tenant> tenants;

  factory PropertyDetail.fromJson(Map<String, dynamic> json) => PropertyDetail(
        propertyId: json["property_id"],
        propertyName: json["property_name"],
        numberOfTenants: json["number_of_tenants"],
        propertyIamge: json["property_iamge"],
        tenants:
            List<Tenant>.from(json["tenants"].map((x) => Tenant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "property_id": propertyId,
        "property_name": propertyName,
        "number_of_tenants": numberOfTenants,
        "property_iamge": propertyIamge,
        "tenants": List<dynamic>.from(tenants.map((x) => x.toJson())),
      };
}

class Tenant {
  Tenant({
    required this.tenantId,
    required this.tenantName,
    required this.phoneNumber,
    required this.tenantRent,
    required this.tenantBirthdate,
    required this.tenantDoc,
    required this.tenantImage,
    required this.tenantCountry,
    required this.propertyId,
    required this.propertyName,
    required this.date,
  });

  String tenantId;
  String tenantName;
  String phoneNumber;
  String tenantRent;
  String tenantBirthdate;
  String tenantDoc;
  String tenantImage;
  String tenantCountry;
  String propertyId;
  String propertyName;
  DateTime date;

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        tenantId: json["tenant_id"],
        tenantName: json["tenant_name"],
        phoneNumber: json["phone_number"],
        tenantRent: json["tenant_rent"],
        tenantBirthdate: json["tenant_birthdate"],
        tenantDoc: json["tenant_doc"],
        tenantImage: json["tenant_image"],
        tenantCountry: json["tenant_country"],
        propertyId: json["property_id"],
        propertyName: json["property_name"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "tenant_id": tenantId,
        "tenant_name": tenantName,
        "phone_number": phoneNumber,
        "tenant_rent": tenantRent,
        "tenant_birthdate": tenantBirthdate,
        "tenant_doc": tenantDoc,
        "tenant_image": tenantImage,
        "tenant_country": tenantCountry,
        "property_id": propertyId,
        "property_name": propertyName,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
