// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
    LoginRequestModel({
    required    this.oneSingnal,
     required   this.type,
     required   this.mobileNo,
     required   this.otp,
    });

    String oneSingnal;
    String type;
    String mobileNo;
    String otp;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        oneSingnal: json["one_singnal"],
        type: json["type"],
        mobileNo: json["mobile_no"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "one_singnal": oneSingnal,
        "type": type,
        "mobile_no": mobileNo,
        "otp": otp,
    };
}
