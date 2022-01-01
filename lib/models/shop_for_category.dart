// To parse this JSON data, do
//
//     final shopForCategoryModel = shopForCategoryModelFromJson(jsonString);

import 'dart:convert';

ShopForCategoryModel shopForCategoryModelFromJson(String str) => ShopForCategoryModel.fromJson(json.decode(str));

String shopForCategoryModelToJson(ShopForCategoryModel data) => json.encode(data.toJson());

class ShopForCategoryModel {
  ShopForCategoryModel({
 required   this.data,
    required    this.status,
    required  this.url,
  });

  Datum data;
  int status;
  String url;

  factory ShopForCategoryModel.fromJson(Map<String, dynamic> json) => ShopForCategoryModel(
    data: Datum.fromJson(json["data"]),

    status: json["status"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "url": url,
  };
}

class Datum {
  Datum({
 required   this.id,
    required   this.category,
    required   this.description,
    required    this.image,
    required    this.menuId,
    this.cgst,
    required    this.gst,
    this.igst,
    this.sgst,
    required    this.status,
    required    this.createdAt,
    this.updatedAt,
  });

  int id;
  String category;
  String description;
  String image;
  String menuId;
  dynamic cgst;
  String gst;
  dynamic igst;
  dynamic sgst;
  String status;
  DateTime createdAt;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    category: json["category"],
    description: json["description"],
    image: json["image"],
    menuId: json["menu_id"],
    cgst: json["CGST"],
    gst: json["GST"],
    igst: json["IGST"],
    sgst: json["SGST"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "description": description,
    "image": image,
    "menu_id": menuId,
    "CGST": cgst,
    "GST": gst,
    "IGST": igst,
    "SGST": sgst,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
  };
}
