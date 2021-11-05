// class ProductModel {
//   final int id;
//   final String productName;
//   final String productImage;
//   final String productDescription;
//   final double price;
//   final String priceLevel;
//   // final String hsnCode;
//   // final double priceBreakdown;

//   ProductModel({
//     // required this.hsnCode,
//     // required this.priceBreakdown,
//     required this.id,
//     required this.productName,
//     required this.productImage,
//     required this.price,
//     required this.productDescription,
//     required this.priceLevel,
//   });
// }

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
       required this.products,
    });

    List<Product> products;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
     required   this.id,
      required  this.title,
       required this.price,
      required  this.description,
     required   this.image,
     required   this.rating,
     required   this.category,
    });

    int id;
    String title;
    double price;
    String description;
    String image;
    Rating rating;
    String category;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
        category: json["category"] == null ? null : json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "rating": rating.toJson(),
        "category": category == null ? null : category,
    };
}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    double rate;
    int count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
