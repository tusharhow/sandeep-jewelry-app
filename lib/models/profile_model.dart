// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    this.kyc,
    required this.user,
    required this.url,
    required this.status,
  });

  dynamic kyc;
  User user;
  String url;
  int status;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        kyc: json["kyc"],
        user: User.fromJson(json["user"]),
        url: json["url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "kyc": kyc,
        "user": user.toJson(),
        "url": url,
        "status": status,
      };
}

class User {
  User({
    required this.id,
    this.isAdmin,
    this.isManufacture,
    required this.name,
    required this.email,
    required this.userType,
    required this.mobileNo,
    this.logo,
    required this.panNo,
    required this.type,
    this.apiToken,
    this.companyName,
    this.address,
    this.pincode,
    this.gstno,
    this.designation,
    this.state,
    this.city,
    this.emailVerifiedAt,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  dynamic isAdmin;
  dynamic isManufacture;
  String name;
  String email;
  String userType;
  String mobileNo;
  dynamic logo;
  String panNo;
  String type;
  dynamic apiToken;
  dynamic companyName;
  dynamic address;
  dynamic pincode;
  dynamic gstno;
  dynamic designation;
  dynamic state;
  dynamic city;
  dynamic emailVerifiedAt;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        isAdmin: json["is_admin"],
        isManufacture: json["is_manufacture"],
        name: json["name"],
        email: json["email"],
        userType: json["user_type"],
        mobileNo: json["mobile_no"],
        logo: json["logo"],
        panNo: json["pan_no"],
        type: json["type"],
        apiToken: json["api_token"],
        companyName: json["company_name"],
        address: json["address"],
        pincode: json["pincode"],
        gstno: json["gstno"],
        designation: json["designation"],
        state: json["state"],
        city: json["city"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_admin": isAdmin,
        "is_manufacture": isManufacture,
        "name": name,
        "email": email,
        "user_type": userType,
        "mobile_no": mobileNo,
        "logo": logo,
        "pan_no": panNo,
        "type": type,
        "api_token": apiToken,
        "company_name": companyName,
        "address": address,
        "pincode": pincode,
        "gstno": gstno,
        "designation": designation,
        "state": state,
        "city": city,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
