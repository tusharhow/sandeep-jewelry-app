// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) => json.encode(data.toJson());

class RegisterRequestModel {
    RegisterRequestModel({
     required   this.name,
     required   this.email,
     required   this.agentCode,
     required   this.type,
     required   this.mobileNo,
     required   this.panNo,
    });

    String name;
    String email;
    String agentCode;
    String type;
    String mobileNo;
    String panNo;

    factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        agentCode: json["agent_code"],
        type: json["type"],
        mobileNo: json["mobile_no"],
        panNo: json["pan_no"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "agent_code": agentCode,
        "type": type,
        "mobile_no": mobileNo,
        "pan_no": panNo,
    };
}
