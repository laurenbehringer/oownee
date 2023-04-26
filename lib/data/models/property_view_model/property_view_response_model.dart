import 'dart:convert';

PropertyViewResponseModel propertyViewResponseModelFromJson(String str) =>
    PropertyViewResponseModel.fromJson(json.decode(str));

String propertyViewResponseModelToJson(PropertyViewResponseModel data) =>
    json.encode(data.toJson());

class PropertyViewResponseModel {
  PropertyViewResponseModel({
    required this.status,
    required this.property,
    required this.tenants,
    required this.code,
  });

  bool status;
  List<Property> property;
  List<Tenant> tenants;
  int code;

  factory PropertyViewResponseModel.fromJson(Map<String, dynamic> json) =>
      PropertyViewResponseModel(
        status: json["status"],
        property: List<Property>.from(
            json["property"].map((x) => Property.fromJson(x))),
        tenants:
            List<Tenant>.from(json["tenants"].map((x) => Tenant.fromJson(x))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "property": List<dynamic>.from(property.map((x) => x.toJson())),
        "tenants": List<dynamic>.from(tenants.map((x) => x.toJson())),
        "code": code,
      };
}

class Property {
  Property({
    required this.id,
    required this.userId,
    required this.propertyName,
    required this.numberOfTenants,
    required this.propertyType,
    required this.monthlyRent,
    required this.maintenanceCharge,
    required this.propertyImage,
    required this.propertyDoc,
    required this.propertyAddress,
  });

  String id;
  String userId;
  String propertyName;
  String numberOfTenants;
  String propertyType;
  String monthlyRent;
  String maintenanceCharge;
  String propertyImage;
  String propertyDoc;
  String propertyAddress;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        userId: json["user_id"],
        propertyName: json["property_name"],
        numberOfTenants: json["number_of_tenants"],
        propertyType: json["property_type"],
        monthlyRent: json["monthly_rent"],
        maintenanceCharge: json["maintenance_charge"],
        propertyImage: json["property_image"],
        propertyDoc: json["property_doc"],
        propertyAddress: json["property_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "property_name": propertyName,
        "number_of_tenants": numberOfTenants,
        "property_type": propertyType,
        "monthly_rent": monthlyRent,
        "maintenance_charge": maintenanceCharge,
        "property_image": propertyImage,
        "property_doc": propertyDoc,
        "property_address": propertyAddress,
      };
}

class Tenant {
  Tenant({
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
  DateTime date;
  String tenantEmail;

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        id: json["id"],
        tenantName: json["tenant_name"],
        phoneNumber: json["phone_number"],
        tenantRent: json["tenant_rent"],
        tenantBirthdate: json["tenant_birthdate"],
        tenantDoc: json["tenant_doc"],
        tenantImage: json["tenant_image"],
        propertyId: json["property_id"],
        tenantCountry: json["tenant_country"],
        date: DateTime.parse(json["date"]),
        tenantEmail: json["tenant_email"],
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
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "tenant_email": tenantEmail,
      };
}
