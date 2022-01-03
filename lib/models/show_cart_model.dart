// To parse this JSON data, do
//
//     final showCartModel = showCartModelFromJson(jsonString);

import 'dart:convert';

ShowCartModel showCartModelFromJson(String str) => ShowCartModel.fromJson(json.decode(str));

String showCartModelToJson(ShowCartModel data) => json.encode(data.toJson());

class ShowCartModel {
  ShowCartModel({
 required   this.message,
    required   this.status,
  });

  String message;
  int status;

  factory ShowCartModel.fromJson(Map<String, dynamic> json) => ShowCartModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
