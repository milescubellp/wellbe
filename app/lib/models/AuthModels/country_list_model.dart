// To parse this JSON data, do
//
//     final countryListModel = countryListModelFromJson(jsonString);

import 'dart:convert';

List<CountryListModel> countryListModelFromJson(String str) => List<CountryListModel>.from(json.decode(str).map((x) => CountryListModel.fromJson(x)));

String countryListModelToJson(List<CountryListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryListModel {
  CountryListModel({
    this.country,
    this.code,
    this.iso,
  });

  String? country;
  String? code;
  String? iso;

  factory CountryListModel.fromJson(Map<String, dynamic> json) => CountryListModel(
    country: json["country"],
    code: json["code"],
    iso: json["iso"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "code": code,
    "iso": iso,
  };
}
