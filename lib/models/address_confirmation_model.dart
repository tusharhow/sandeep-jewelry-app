// To parse this JSON data, do
//
//     final addressConfirmationModel = addressConfirmationModelFromJson(jsonString);

import 'dart:convert';

AddressConfirmationModel addressConfirmationModelFromJson(String str) =>
    AddressConfirmationModel.fromJson(json.decode(str));

String addressConfirmationModelToJson(AddressConfirmationModel data) =>
    json.encode(data.toJson());

class AddressConfirmationModel {
  AddressConfirmationModel({
    required this.first,
    required this.last,
    required this.country,
    required this.address,
    required this.pincode,
    required this.city,
    required this.region,
    required this.mobileno,
  });

  String first;
  String last;
  String country;
  String address;
  String pincode;
  String city;
  String region;
  String mobileno;

  factory AddressConfirmationModel.fromJson(Map<String, dynamic> json) =>
      AddressConfirmationModel(
        first: json["first"],
        last: json["last"],
        country: json["country"],
        address: json["address"],
        pincode: json["pincode"],
        city: json["city"],
        region: json["region"],
        mobileno: json["mobileno"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "country": country,
        "address": address,
        "pincode": pincode,
        "city": city,
        "region": region,
        "mobileno": mobileno,
      };
}
