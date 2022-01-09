// To parse this JSON data, do
//
//     final deleteCartModel = deleteCartModelFromJson(jsonString);

import 'dart:convert';

DeleteCartModel deleteCartModelFromJson(String str) => DeleteCartModel.fromJson(json.decode(str));

String deleteCartModelToJson(DeleteCartModel data) => json.encode(data.toJson());

class DeleteCartModel {
    DeleteCartModel({
    required    this.message,
     required   this.status,
    });

    String message;
    int status;

    factory DeleteCartModel.fromJson(Map<String, dynamic> json) => DeleteCartModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
