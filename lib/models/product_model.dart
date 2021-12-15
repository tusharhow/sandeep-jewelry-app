// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.products,
  });

  List<Product> products;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    required this.categoryId,
    required this.subcategoryId,
    required this.subsubcategoryId,
    required this.productcode,
    required this.productname,
    required this.gender,
    required this.color,
    required this.jwelleryType,
    required this.defaultSize,
    required this.sizeType,
    required this.description,
    this.manufactureId,
    required this.certifiedId,
    required this.priceType,
    required this.amount,
    this.websiteView,
    this.guestView,
    this.registerView,
    this.recommendProduct,
    this.bestSellers,
    this.trendingCategories,
    required this.image,
    required this.status,
    required this.importedFromExcel,
    required this.createdAt,
    this.updatedAt,
    required this.category,
    required this.menuId,
    this.cgst,
    required this.gst,
    this.igst,
    this.sgst,
    required this.subcategory,
    required this.title,
    this.jwelleryName,
  });

  dynamic id;
  String categoryId;
  String subcategoryId;
  String subsubcategoryId;
  String productcode;
  String productname;
  String gender;
  String color;
  String jwelleryType;
  String defaultSize;
  String sizeType;
  String description;
  dynamic manufactureId;
  String certifiedId;
  String priceType;
  String amount;
  dynamic websiteView;
  dynamic guestView;
  dynamic registerView;
  dynamic recommendProduct;
  dynamic bestSellers;
  dynamic trendingCategories;
  String image;
  String status;
  int importedFromExcel;
  DateTime createdAt;
  dynamic updatedAt;
  String category;
  String menuId;
  dynamic cgst;
  String gst;
  dynamic igst;
  dynamic sgst;
  String subcategory;
  String title;
  dynamic jwelleryName;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        subsubcategoryId: json["subsubcategory_id"],
        productcode: json["productcode"],
        productname: json["productname"],
        gender: json["gender"],
        color: json["color"],
        jwelleryType: json["jwellery_type"],
        defaultSize: json["default_size"],
        sizeType: json["size_type"],
        description: json["description"],
        manufactureId: json["manufacture_id"],
        certifiedId: json["certified_id"],
        priceType: json["price_type"],
        amount: json["amount"],
        websiteView: json["website_view"],
        guestView: json["guest_view"],
        registerView: json["register_view"],
        recommendProduct: json["recommend_product"],
        bestSellers: json["best_sellers"],
        trendingCategories: json["trending_categories"],
        image: json["image"],
        status: json["status"],
        importedFromExcel: json["imported_from_excel"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        category: json["category"],
        menuId: json["menu_id"],
        cgst: json["CGST"],
        gst: json["GST"],
        igst: json["IGST"],
        sgst: json["SGST"],
        subcategory: json["subcategory"],
        title: json["title"],
        jwelleryName: json["jwellery_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "subsubcategory_id": subsubcategoryId,
        "productcode": productcode,
        "productname": productname,
        "gender": gender,
        "color": color,
        "jwellery_type": jwelleryType,
        "default_size": defaultSize,
        "size_type": sizeType,
        "description": description,
        "manufacture_id": manufactureId,
        "certified_id": certifiedId,
        "price_type": priceType,
        "amount": amount,
        "website_view": websiteView,
        "guest_view": guestView,
        "register_view": registerView,
        "recommend_product": recommendProduct,
        "best_sellers": bestSellers,
        "trending_categories": trendingCategories,
        "image": image,
        "status": status,
        "imported_from_excel": importedFromExcel,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "category": category,
        "menu_id": menuId,
        "CGST": cgst,
        "GST": gst,
        "IGST": igst,
        "SGST": sgst,
        "subcategory": subcategory,
        "title": title,
        "jwellery_name": jwelleryName,
      };
}

