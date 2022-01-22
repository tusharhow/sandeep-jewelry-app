// To parse this JSON data, do
//
//     final userEditModel = userEditModelFromJson(jsonString);

import 'dart:convert';

UserEditModel userEditModelFromJson(String str) => UserEditModel.fromJson(json.decode(str));

String userEditModelToJson(UserEditModel data) => json.encode(data.toJson());

class UserEditModel {
    UserEditModel({
     required   this.data,
     required   this.url,
     required   this.status,
    });

    Data data;
    String url;
    int status;

    factory UserEditModel.fromJson(Map<String, dynamic> json) => UserEditModel(
        data: Data.fromJson(json["data"]),
        url: json["url"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "url": url,
        "status": status,
    };
}

class Data {
    Data({
     required   this.id,
        this.isAdmin,
        this.isManufacture,
     required   this.name,
      required  this.email,
        this.userType,
      required  this.mobileNo,
      required  this.logo,
      required  this.panNo,
       required this.type,
        this.apiToken,
       required this.companyName,
       required this.address,
       required this.pincode,
      required  this.gstno,
      required  this.designation,
      required  this.state,
      required  this.city,
        this.emailVerifiedAt,
      required  this.status,
      required  this.createdAt,
      required  this.updatedAt,
    });

    int id;
    dynamic isAdmin;
    dynamic isManufacture;
    String name;
    String email;
    dynamic userType;
    String mobileNo;
    String logo;
    String panNo;
    String type;
    dynamic apiToken;
    String companyName;
    String address;
    String pincode;
    String gstno;
    String designation;
    String state;
    String city;
    dynamic emailVerifiedAt;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
