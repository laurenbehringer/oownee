import 'dart:convert';

OwnerViewResponseModel ownerViewResponseModelFromJson(String str) =>
    OwnerViewResponseModel.fromJson(json.decode(str));

String ownerViewResponseModelToJson(OwnerViewResponseModel data) =>
    json.encode(data.toJson());

class OwnerViewResponseModel {
  OwnerViewResponseModel({
    required this.status,
    required this.data,
    required this.code,
  });

  bool status;
  List<Datum> data;
  int code;

  factory OwnerViewResponseModel.fromJson(Map<String, dynamic> json) =>
      OwnerViewResponseModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.country,
    required this.address,
    required this.phoneNumber,
    required this.googleId,
    required this.roleId,
    required this.image,
    required this.docs,
    required this.status,
    required this.regDate,
    required this.lastOtp,
  });

  String id;
  String fullName;
  String email;
  String password;
  String country;
  String address;
  String phoneNumber;
  String googleId;
  String roleId;
  String image;
  String docs;
  String status;
  DateTime regDate;
  String lastOtp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        country: json["country"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        googleId: json["google_id"],
        roleId: json["role_id"],
        image: json["image"],
        docs: json["docs"],
        status: json["status"],
        regDate: DateTime.parse(json["reg_date"]),
        lastOtp: json["last_otp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "password": password,
        "country": country,
        "address": address,
        "phone_number": phoneNumber,
        "google_id": googleId,
        "role_id": roleId,
        "image": image,
        "docs": docs,
        "status": status,
        "reg_date":
            "${regDate.year.toString().padLeft(4, '0')}-${regDate.month.toString().padLeft(2, '0')}-${regDate.day.toString().padLeft(2, '0')}",
        "last_otp": lastOtp,
      };
}
