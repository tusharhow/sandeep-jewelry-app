// To parse this JSON data, do
//
//     final showCartModel = showCartModelFromJson(jsonString);

import 'dart:convert';

ShowCartModel showCartModelFromJson(String str) =>
    ShowCartModel.fromJson(json.decode(str));

String showCartModelToJson(ShowCartModel data) => json.encode(data.toJson());

class ShowCartModel {
  ShowCartModel({
    required this.data,
    required this.status,
    required this.url,
  });

  List<Datum> data;
  int status;
  String url;

  factory ShowCartModel.fromJson(Map<String, dynamic> json) => ShowCartModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "url": url,
      };
}

class Datum {
  Datum({
    required this.cartId,
    required this.count,
    required this.productId,
    required this.userId,
    required this.category,
    required this.subCategory,
    required this.subSubCategory,
    required this.productCode,
    required this.defaultSize,
    required this.jwelleryType,
    required this.selectedColor,
    required this.productSize,
    required this.productName,
    required this.description,
    required this.image,
    required this.priceType,
    required this.amount,
    required this.gst,
    this.assests,
  });

  int cartId;
  String count;
  String productId;
  String userId;
  String category;
  String subCategory;
  String subSubCategory;
  String productCode;
  String defaultSize;
  String jwelleryType;
  String selectedColor;
  String productSize;
  String productName;
  String description;
  String image;
  String priceType;
  String amount;
  String gst;
  dynamic assests;

  

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cartId: json["cart_id"],
        count: json["count"],
        productId: json["product_id"],
        userId: json["user_id"],
        category: json["category"],
        subCategory: json["subCategory"],
        subSubCategory: json["subSubCategory"],
        productCode: json["productCode"],
        defaultSize: json["default_size"],
        jwelleryType: json["jwellery_type"],
        selectedColor: json["selectedColor"],
        productSize: json["product_size"],
        productName: json["productName"],
        description: json["description"],
        image: json["image"],
        priceType: json["price_type"],
        amount: json["amount"],
        gst: json["gst"],
        assests: json["assests"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "count": count,
        "product_id": productId,
        "user_id": userId,
        "category": category,
        "subCategory": subCategory,
        "subSubCategory": subSubCategory,
        "productCode": productCode,
        "default_size": defaultSize,
        "jwellery_type": jwelleryType,
        "selectedColor": selectedColor,
        "product_size": productSize,
        "productName": productName,
        "description": description,
        "image": image,
        "price_type": priceType,
        "amount": amount,
        "gst": gst,
        "assests": assests,
      };
}
