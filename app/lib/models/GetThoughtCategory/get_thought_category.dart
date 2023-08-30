// To parse this JSON data, do
//
//     final getThoughtCategoryModel = getThoughtCategoryModelFromJson(jsonString);

import 'dart:convert';

GetThoughtCategoryModel getThoughtCategoryModelFromJson(String str) =>
    GetThoughtCategoryModel.fromJson(json.decode(str));

String getThoughtCategoryModelToJson(GetThoughtCategoryModel data) =>
    json.encode(data.toJson());

class GetThoughtCategoryModel {
  int? id;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  GetThoughtCategoryModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory GetThoughtCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetThoughtCategoryModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
