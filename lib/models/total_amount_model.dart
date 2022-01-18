// To parse this JSON data, do
//
//     final totalAmountModel = totalAmountModelFromJson(jsonString);

import 'dart:convert';

TotalAmountModel totalAmountModelFromJson(String str) => TotalAmountModel.fromJson(json.decode(str));

String totalAmountModelToJson(TotalAmountModel data) => json.encode(data.toJson());

class TotalAmountModel {
    TotalAmountModel({
      required  this.totalAmount,
      required  this.status,
    });

    int totalAmount;
    int status;

    factory TotalAmountModel.fromJson(Map<String, dynamic> json) => TotalAmountModel(
        totalAmount: json["totalAmount"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
        "status": status,
    };
}
