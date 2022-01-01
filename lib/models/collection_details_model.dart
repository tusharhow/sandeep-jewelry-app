// To parse this JSON data, do
//
//     final collectionDetailsModel = collectionDetailsModelFromJson(jsonString);

import 'dart:convert';

CollectionDetailsModel collectionDetailsModelFromJson(String str) =>
    CollectionDetailsModel.fromJson(json.decode(str));

String collectionDetailsModelToJson(CollectionDetailsModel data) =>
    json.encode(data.toJson());

class CollectionDetailsModel {
  CollectionDetailsModel({
    required this.data,
    required this.pagination,
    required this.status,
    required this.url,
  });

  Datum data;
  int pagination;
  int status;
  String url;

  factory CollectionDetailsModel.fromJson(Map<String, dynamic> json) =>
      CollectionDetailsModel(
        data: Datum.fromJson(json["data"]),
        pagination: json["pagination"],
        status: json["status"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
       "data": data.toJson(),
        "pagination": pagination,
        "status": status,
        "url": url,
      };
}

class Datum {
  Datum({
    required this.productId,
    required this.category,
    required this.gst,
    required this.categoryId,
    required this.subcategory,
    required this.subcategorytype,
    required this.jwelleryName,
    required this.productcode,
    required this.productname,
    required this.description,
    required this.websiteView,
    required this.guestView,
    required this.registerView,
    required this.recommendProduct,
    required this.bestSellers,
    required this.trendingCategories,
    required this.sizeType,
    required this.priceType,
    required this.certifiedId,
    required this.jewelleryColor,
    required this.defaultSize,
    required this.jewellerySize,
    this.amount,
    required this.featureImg,
    required this.images,
    this.purity,
    required this.grossWeight,
    required this.totalAmt,
    required this.totalOfferAmt,
  });

  int productId;
  String category;
  String gst;
  String categoryId;
  String subcategory;
  String subcategorytype;
  String jwelleryName;
  String productcode;
  String productname;
  String description;
  String websiteView;
  String guestView;
  String registerView;
  String recommendProduct;
  String bestSellers;
  String trendingCategories;
  String sizeType;
  String priceType;
  List<String> certifiedId;
  List<String> jewelleryColor;
  String defaultSize;
  List<JewellerySize> jewellerySize;
  dynamic amount;
  String featureImg;
  List<String> images;
  dynamic purity;
  String grossWeight;
  int totalAmt;
  int totalOfferAmt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        category: json["category"],
        gst: json["GST"],
        categoryId: json["category_id"],
        subcategory: json["subcategory"],
        subcategorytype: json["subcategorytype"],
        jwelleryName: json["jwellery_name"],
        productcode: json["productcode"],
        productname: json["productname"],
        description: json["description"],
        websiteView: json["website_view"],
        guestView: json["guest_view"],
        registerView: json["register_view"],
        recommendProduct: json["recommend_product"],
        bestSellers: json["best_sellers"],
        trendingCategories: json["trending_categories"],
        sizeType: json["size_type"],
        priceType: json["price_type"],
        certifiedId: List<String>.from(json["certified_id"].map((x) => x)),
        jewelleryColor:
            List<String>.from(json["jewellery_color"].map((x) => x)),
        defaultSize: json["default_size"],
        jewellerySize: List<JewellerySize>.from(
            json["jewellery_size"].map((x) => JewellerySize.fromJson(x))),
        amount: json["amount"],
        featureImg: json["feature_img"],
        images: List<String>.from(json["images"].map((x) => x)),
        purity: json["purity"],
        grossWeight: json["gross_weight"],
        totalAmt: json["total_amt"],
        totalOfferAmt: json["total_offer_amt"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "category": category,
        "GST": gst,
        "category_id": categoryId,
        "subcategory": subcategory,
        "subcategorytype": subcategorytype,
        "jwellery_name": jwelleryName,
        "productcode": productcode,
        "productname": productname,
        "description": description,
        "website_view": websiteView,
        "guest_view": guestView,
        "register_view": registerView,
        "recommend_product": recommendProduct,
        "best_sellers": bestSellers,
        "trending_categories": trendingCategories,
        "size_type": sizeType,
        "price_type": priceType,
        "certified_id": List<dynamic>.from(certifiedId.map((x) => x)),
        "jewellery_color": List<dynamic>.from(jewelleryColor.map((x) => x)),
        "default_size": defaultSize,
        "jewellery_size":
            List<dynamic>.from(jewellerySize.map((x) => x.toJson())),
        "amount": amount,
        "feature_img": featureImg,
        "images": List<dynamic>.from(images.map((x) => x)),
        "purity": purity,
        "gross_weight": grossWeight,
        "total_amt": totalAmt,
        "total_offer_amt": totalOfferAmt,
      };
}

class JewellerySize {
  JewellerySize({
    required this.id,
    required this.jwelleryType,
    required this.sizes,
    this.bangleSize,
    required this.createdAt,
  });

  int id;
  String jwelleryType;
  String sizes;
  dynamic bangleSize;
  DateTime createdAt;

  factory JewellerySize.fromJson(Map<String, dynamic> json) => JewellerySize(
        id: json["id"],
        jwelleryType: json["jwellery_type"],
        sizes: json["sizes"],
        bangleSize: json["bangle_size"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jwellery_type": jwelleryType,
        "sizes": sizes,
        "bangle_size": bangleSize,
        "created_at": createdAt.toIso8601String(),
      };
}
