// To parse this JSON data, do
//
//     final addOrderModel = addOrderModelFromJson(jsonString);

import 'dart:convert';

AddOrderModel addOrderModelFromJson(String str) => AddOrderModel.fromJson(json.decode(str));

String addOrderModelToJson(AddOrderModel data) => json.encode(data.toJson());

class AddOrderModel {
    AddOrderModel({
     required   this.message,
      required  this.orderId,
      required  this.status,
    });

    String message;
    int orderId;
    int status;

    factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
        message: json["message"],
        orderId: json["Order_id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "Order_id": orderId,
        "status": status,
    };
}
