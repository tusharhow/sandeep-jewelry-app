// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
  WishListModel({
    required this.data,
    required this.status,
    required this.url,
  });

  List<Datum> data;
  int status;
  String url;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
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
    required this.wishlistId,
    required this.productId,
    required this.productname,
    required this.size,
    required this.image,
    this.assets,
  });

  int wishlistId;
  int productId;
  String productname;
  String size;
  String image;
  dynamic assets;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        wishlistId: json["wishlist_id"],
        productId: json["product_id"],
        productname: json["productname"],
        size: json["size"],
        image: json["image"],
        assets: json["assets"],
      );

  Map<String, dynamic> toJson() => {
        "wishlist_id": wishlistId,
        "product_id": productId,
        "productname": productname,
        "size": size,
        "image": image,
        "assets": assets,
      };
}
