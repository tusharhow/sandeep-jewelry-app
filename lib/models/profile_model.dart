// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
     required   this.name,
    required    this.email,
     required   this.password,
       required this.agentCode,
      required  this.type,
      required  this.mobileNo,
      required  this.panNo,
    });

    String name;
    String email;
    String password;
    String agentCode;
    String type;
    String mobileNo;
    String panNo;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        agentCode: json["agent_code"],
        type: json["type"],
        mobileNo: json["mobile_no"],
        panNo: json["pan_no"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "agent_code": agentCode,
        "type": type,
        "mobile_no": mobileNo,
        "pan_no": panNo,
    };
}
