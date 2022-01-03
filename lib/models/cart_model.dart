// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
 required   this.productId,
    required this.productSize,
    required  this.count,
    required this.selectedColor,
    required  this.jwelleryName,
    required this.assests,
  });

  String productId;
  String productSize;
  String count;
  String selectedColor;
  String jwelleryName;
  String assests;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    productId: json["product_id"],
    productSize: json["product_size"],
    count: json["count"],
    selectedColor: json["selectedColor"],
    jwelleryName: json["jwellery_name"],
    assests: json["assests"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_size": productSize,
    "count": count,
    "selectedColor": selectedColor,
    "jwellery_name": jwelleryName,
    "assests": assests,
  };
}
