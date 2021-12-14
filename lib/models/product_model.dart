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
    this.CGST,
    required this.GST,
    this.IGST,
    this.SGST,
    required this.subcategory,
    required this.title,
    this.jwelleryName,
  });
  late final Null id;
  late final String categoryId;
  late final String subcategoryId;
  late final String subsubcategoryId;
  late final String productcode;
  late final String productname;
  late final String gender;
  late final String color;
  late final String jwelleryType;
  late final String defaultSize;
  late final String sizeType;
  late final String description;
  late final Null manufactureId;
  late final String certifiedId;
  late final String priceType;
  late final String amount;
  late final Null websiteView;
  late final Null guestView;
  late final Null registerView;
  late final Null recommendProduct;
  late final Null bestSellers;
  late final Null trendingCategories;
  late final String image;
  late final String status;
  late final int importedFromExcel;
  late final String createdAt;
  late final Null updatedAt;
  late final String category;
  late final String menuId;
  late final Null CGST;
  late final String GST;
  late final Null IGST;
  late final Null SGST;
  late final String subcategory;
  late final String title;
  late final Null jwelleryName;

  Product.fromJson(Map<String, dynamic> json) {
    id = null;
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subsubcategoryId = json['subsubcategory_id'];
    productcode = json['productcode'];
    productname = json['productname'];
    gender = json['gender'];
    color = json['color'];
    jwelleryType = json['jwellery_type'];
    defaultSize = json['default_size'];
    sizeType = json['size_type'];
    description = json['description'];
    manufactureId = null;
    certifiedId = json['certified_id'];
    priceType = json['price_type'];
    amount = json['amount'];
    websiteView = null;
    guestView = null;
    registerView = null;
    recommendProduct = null;
    bestSellers = null;
    trendingCategories = null;
    image = json['image'];
    status = json['status'];
    importedFromExcel = json['imported_from_excel'];
    createdAt = json['created_at'];
    updatedAt = null;
    category = json['category'];
    menuId = json['menu_id'];
    CGST = null;
    GST = json['GST'];
    IGST = null;
    SGST = null;
    subcategory = json['subcategory'];
    title = json['title'];
    jwelleryName = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['subcategory_id'] = subcategoryId;
    _data['subsubcategory_id'] = subsubcategoryId;
    _data['productcode'] = productcode;
    _data['productname'] = productname;
    _data['gender'] = gender;
    _data['color'] = color;
    _data['jwellery_type'] = jwelleryType;
    _data['default_size'] = defaultSize;
    _data['size_type'] = sizeType;
    _data['description'] = description;
    _data['manufacture_id'] = manufactureId;
    _data['certified_id'] = certifiedId;
    _data['price_type'] = priceType;
    _data['amount'] = amount;
    _data['website_view'] = websiteView;
    _data['guest_view'] = guestView;
    _data['register_view'] = registerView;
    _data['recommend_product'] = recommendProduct;
    _data['best_sellers'] = bestSellers;
    _data['trending_categories'] = trendingCategories;
    _data['image'] = image;
    _data['status'] = status;
    _data['imported_from_excel'] = importedFromExcel;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['category'] = category;
    _data['menu_id'] = menuId;
    _data['CGST'] = CGST;
    _data['GST'] = GST;
    _data['IGST'] = IGST;
    _data['SGST'] = SGST;
    _data['subcategory'] = subcategory;
    _data['title'] = title;
    _data['jwellery_name'] = jwelleryName;
    return _data;
  }
}
