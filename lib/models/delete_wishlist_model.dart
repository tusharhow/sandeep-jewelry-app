// To parse this JSON data, do
//
//     final deleteWishlistModel = deleteWishlistModelFromJson(jsonString);

import 'dart:convert';

DeleteWishlistModel deleteWishlistModelFromJson(String str) => DeleteWishlistModel.fromJson(json.decode(str));

String deleteWishlistModelToJson(DeleteWishlistModel data) => json.encode(data.toJson());

class DeleteWishlistModel {
    DeleteWishlistModel({
     required   this.message,
      required  this.status,
    });

    String message;
    int status;

    factory DeleteWishlistModel.fromJson(Map<String, dynamic> json) => DeleteWishlistModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
