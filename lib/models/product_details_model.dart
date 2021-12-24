// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    required this.data,
    required this.assets,
    required this.similarProducts,
    required this.status,
    required this.url,
  });

  Data data;
  Assets assets;
  List<SimilarProduct> similarProducts;
  int status;
  String url;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        data: Data.fromJson(json["data"]),
        assets: Assets.fromJson(json["assets"]),
        similarProducts: List<SimilarProduct>.from(
            json["similar_products"].map((x) => SimilarProduct.fromJson(x))),
        status: json["status"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "assets": assets.toJson(),
        "similar_products":
            List<dynamic>.from(similarProducts.map((x) => x.toJson())),
        "status": status,
        "url": url,
      };
}

class Assets {
  Assets({
    required this.gold,
    required this.diamond,
    required this.silver,
    required this.stone,
  });

  List<Gold> gold;
  List<Diamond> diamond;
  List<Gold> silver;
  List<Gold> stone;

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        gold: List<Gold>.from(json["Gold"].map((x) => Gold.fromJson(x))),
        diamond:
            List<Diamond>.from(json["Diamond"].map((x) => Diamond.fromJson(x))),
        silver: List<Gold>.from(json["Silver"].map((x) => Gold.fromJson(x))),
        stone: List<Gold>.from(json["Stone"].map((x) => Gold.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Gold": List<dynamic>.from(gold.map((x) => x.toJson())),
        "Diamond": List<dynamic>.from(diamond.map((x) => x.toJson())),
        "Silver": List<dynamic>.from(silver.map((x) => x.toJson())),
        "Stone": List<dynamic>.from(stone.map((x) => x.toJson())),
      };
}

class Diamond {
  Diamond({
    required this.grossWeight,
    required this.netWeight,
    required this.multiWeight,
    required this.purity,
    required this.weight,
    required this.wastage,
    required this.quantity,
    required this.defaultColor,
    required this.defaultClarity,
    required this.makingCharge,
    required this.totalMakingCharge,
    required this.totalOfferAmt,
    required this.totalAmt,
    required this.chargesOption,
    required this.offerCoupan,
    required this.offerCoupanAmount,
    required this.rate,
    required this.stonetype,
    required this.diamondChargesOption,
    required this.diaRate,
    required this.color,
    required this.productId,
    required this.materialId,
    required this.materialType,
  });

  String grossWeight;
  String netWeight;
  String multiWeight;
  String purity;
  String weight;
  String wastage;
  String quantity;
  String defaultColor;
  String defaultClarity;
  String makingCharge;
  String totalMakingCharge;
  String totalOfferAmt;
  int totalAmt;
  String chargesOption;
  String offerCoupan;
  String offerCoupanAmount;
  String rate;
  List<dynamic> stonetype;
  String diamondChargesOption;
  String diaRate;
  List<Color> color;
  String productId;
  String materialId;
  String materialType;

  factory Diamond.fromJson(Map<String, dynamic> json) => Diamond(
        grossWeight: json["gross_weight"],
        netWeight: json["net_weight"],
        multiWeight: json["multi_weight"],
        purity: json["purity"],
        weight: json["weight"],
        wastage: json["wastage"],
        quantity: json["quantity"],
        defaultColor: json["default_color"],
        defaultClarity: json["default_clarity"],
        makingCharge: json["making_charge"],
        totalMakingCharge: json["total_making_charge"],
        totalOfferAmt: json["total_offer_amt"],
        totalAmt: json["total_amt"],
        chargesOption: json["charges_option"],
        offerCoupan: json["offer_coupan"],
        offerCoupanAmount: json["offer_coupan_amount"],
        rate: json["rate"],
        stonetype: List<dynamic>.from(json["stonetype"].map((x) => x)),
        diamondChargesOption: json["diamond_charges_option"],
        diaRate: json["dia_rate"],
        color: List<Color>.from(json["color"].map((x) => Color.fromJson(x))),
        productId: json["product_id"],
        materialId: json["material_id"],
        materialType: json["material_type"],
      );

  Map<String, dynamic> toJson() => {
        "gross_weight": grossWeight,
        "net_weight": netWeight,
        "multi_weight": multiWeight,
        "purity": purity,
        "weight": weight,
        "wastage": wastage,
        "quantity": quantity,
        "default_color": defaultColor,
        "default_clarity": defaultClarity,
        "making_charge": makingCharge,
        "total_making_charge": totalMakingCharge,
        "total_offer_amt": totalOfferAmt,
        "total_amt": totalAmt,
        "charges_option": chargesOption,
        "offer_coupan": offerCoupan,
        "offer_coupan_amount": offerCoupanAmount,
        "rate": rate,
        "stonetype": List<dynamic>.from(stonetype.map((x) => x)),
        "diamond_charges_option": diamondChargesOption,
        "dia_rate": diaRate,
        "color": List<dynamic>.from(color.map((x) => x.toJson())),
        "product_id": productId,
        "material_id": materialId,
        "material_type": materialType,
      };
}

class Color {
  Color({
    required this.id,
    required this.color,
    required this.clarity,
    required this.price,
    required this.colorDefault,
  });

  int id;
  String color;
  String clarity;
  String price;
  String colorDefault;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        color: json["color"],
        clarity: json["clarity"],
        price: json["price"],
        colorDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "clarity": clarity,
        "price": price,
        "default": colorDefault,
      };
}

class Gold {
  Gold({
    required this.grossWeight,
    required this.netWeight,
    required this.multiWeight,
    required this.purity,
    required this.weight,
    required this.wastage,
    required this.quantity,
    required this.diaColClar,
    required this.defaultColor,
    required this.defaultClarity,
    required this.makingCharge,
    required this.totalMakingCharge,
    required this.totalOfferAmt,
    required this.totalAmt,
    required this.chargesOption,
    required this.offerCoupan,
    required this.offerCoupanAmount,
    required this.rate,
    required this.stonetype,
    required this.diamondChargesOption,
    required this.diaRate,
    required this.color,
    required this.productId,
    required this.materialId,
    required this.materialType,
  });

  String grossWeight;
  String netWeight;
  String multiWeight;
  String purity;
  String weight;
  String wastage;
  String quantity;
  String diaColClar;
  String defaultColor;
  String defaultClarity;
  String makingCharge;
  String totalMakingCharge;
  String totalOfferAmt;
  int totalAmt;
  String chargesOption;
  String offerCoupan;
  String offerCoupanAmount;
  String rate;
  List<dynamic> stonetype;
  String diamondChargesOption;
  String diaRate;
  String color;
  String productId;
  String materialId;
  String materialType;

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        grossWeight: json["gross_weight"],
        netWeight: json["net_weight"],
        multiWeight: json["multi_weight"],
        purity: json["purity"],
        weight: json["weight"],
        wastage: json["wastage"],
        quantity: json["quantity"],
        diaColClar: json["dia_col_clar"],
        defaultColor: json["default_color"],
        defaultClarity: json["default_clarity"],
        makingCharge: json["making_charge"],
        totalMakingCharge: json["total_making_charge"],
        totalOfferAmt: json["total_offer_amt"],
        totalAmt: json["total_amt"],
        chargesOption: json["charges_option"],
        offerCoupan: json["offer_coupan"],
        offerCoupanAmount: json["offer_coupan_amount"],
        rate: json["rate"],
        stonetype: List<dynamic>.from(json["stonetype"].map((x) => x)),
        diamondChargesOption: json["diamond_charges_option"],
        diaRate: json["dia_rate"],
        color: json["color"],
        productId: json["product_id"],
        materialId: json["material_id"],
        materialType: json["material_type"],
      );

  Map<String, dynamic> toJson() => {
        "gross_weight": grossWeight,
        "net_weight": netWeight,
        "multi_weight": multiWeight,
        "purity": purity,
        "weight": weight,
        "wastage": wastage,
        "quantity": quantity,
        "dia_col_clar": diaColClar,
        "default_color": defaultColor,
        "default_clarity": defaultClarity,
        "making_charge": makingCharge,
        "total_making_charge": totalMakingCharge,
        "total_offer_amt": totalOfferAmt,
        "total_amt": totalAmt,
        "charges_option": chargesOption,
        "offer_coupan": offerCoupan,
        "offer_coupan_amount": offerCoupanAmount,
        "rate": rate,
        "stonetype": List<dynamic>.from(stonetype.map((x) => x)),
        "diamond_charges_option": diamondChargesOption,
        "dia_rate": diaRate,
        "color": color,
        "product_id": productId,
        "material_id": materialId,
        "material_type": materialType,
      };
}

class Data {
  Data({
    required this.productId,
    required this.categoryId,
    required this.gst,
    required this.category,
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
    required this.priceType,
    required this.certifiedId,
    required this.jewelleryColor,
    required this.defaultSize,
    required this.jewellerySize,
    required this.amount,
    required this.featureImg,
    required this.files,
    this.purity,
    required this.grossWeight,
    required this.totalAmt,
    required this.totalOfferAmt,
  });

  String productId;
  String categoryId;
  String gst;
  String category;
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
  String priceType;
  List<CertifiedId> certifiedId;
  List<JewelleryColor> jewelleryColor;
  String defaultSize;
  List<JewellerySize> jewellerySize;
  String amount;
  String featureImg;
  List<FileElement> files;
  dynamic purity;
  String grossWeight;
  int totalAmt;
  int totalOfferAmt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
        categoryId: json["category_id"],
        gst: json["GST"],
        category: json["category"],
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
        priceType: json["price_type"],
        certifiedId: List<CertifiedId>.from(
            json["certified_id"].map((x) => CertifiedId.fromJson(x))),
        jewelleryColor: List<JewelleryColor>.from(
            json["jewellery_color"].map((x) => JewelleryColor.fromJson(x))),
        defaultSize: json["default_size"],
        jewellerySize: List<JewellerySize>.from(
            json["jewellery_size"].map((x) => JewellerySize.fromJson(x))),
        amount: json["amount"],
        featureImg: json["feature_img"],
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        purity: json["purity"],
        grossWeight: json["gross_weight"],
        totalAmt: json["total_amt"],
        totalOfferAmt: json["total_offer_amt"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "category_id": categoryId,
        "GST": gst,
        "category": category,
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
        "price_type": priceType,
        "certified_id": List<dynamic>.from(certifiedId.map((x) => x.toJson())),
        "jewellery_color":
            List<dynamic>.from(jewelleryColor.map((x) => x.toJson())),
        "default_size": defaultSize,
        "jewellery_size":
            List<dynamic>.from(jewellerySize.map((x) => x.toJson())),
        "amount": amount,
        "feature_img": featureImg,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "purity": purity,
        "gross_weight": grossWeight,
        "total_amt": totalAmt,
        "total_offer_amt": totalOfferAmt,
      };
}

class CertifiedId {
  CertifiedId({
    required this.id,
    required this.certiName,
    required this.image,
    required this.createdAt,
    this.updatedAt,
  });

  int id;
  String certiName;
  String image;
  DateTime createdAt;
  dynamic updatedAt;

  factory CertifiedId.fromJson(Map<String, dynamic> json) => CertifiedId(
        id: json["id"],
        certiName: json["certi_name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "certi_name": certiName,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}

class FileElement {
  FileElement({
    required this.id,
    required this.productId,
    required this.image,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String productId;
  String image;
  int type;
  DateTime createdAt;
  DateTime updatedAt;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class JewelleryColor {
  JewelleryColor({
    required this.id,
    required this.jewelleryColor,
  });

  int id;
  String jewelleryColor;

  factory JewelleryColor.fromJson(Map<String, dynamic> json) => JewelleryColor(
        id: json["id"],
        jewelleryColor: json["jewellery_color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jewellery_color": jewelleryColor,
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

class SimilarProduct {
  SimilarProduct({
    required this.productId,
    required this.gst,
    required this.productcode,
    required this.productname,
    required this.priceType,
    required this.defaultSize,
    required this.amount,
    required this.featureImg,
    required this.purity,
    required this.grossWeight,
    required this.totalAmt,
    required this.totalOfferAmt,
  });

  String productId;
  String gst;
  String productcode;
  String productname;
  String priceType;
  String defaultSize;
  String amount;
  String featureImg;
  String purity;
  String grossWeight;
  int totalAmt;
  int totalOfferAmt;

  factory SimilarProduct.fromJson(Map<String, dynamic> json) => SimilarProduct(
        productId: json["product_id"],
        gst: json["GST"],
        productcode: json["productcode"],
        productname: json["productname"],
        priceType: json["price_type"],
        defaultSize: json["default_size"],
        amount: json["amount"] == null ? null : json["amount"],
        featureImg: json["feature_img"],
        purity: json["purity"] == null ? null : json["purity"],
        grossWeight: json["gross_weight"],
        totalAmt: json["total_amt"],
        totalOfferAmt: json["total_offer_amt"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "GST": gst,
        "productcode": productcode,
        "productname": productname,
        "price_type": priceType,
        "default_size": defaultSize,
        "amount": amount == null ? null : amount,
        "feature_img": featureImg,
        "purity": purity == null ? null : purity,
        "gross_weight": grossWeight,
        "total_amt": totalAmt,
        "total_offer_amt": totalOfferAmt,
      };
}
