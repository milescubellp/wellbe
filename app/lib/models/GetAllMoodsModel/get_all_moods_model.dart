// To parse this JSON data, do
//
//     final getAllMoodsModel = getAllMoodsModelFromJson(jsonString);

import 'dart:convert';

GetAllMoodsModel getAllMoodsModelFromJson(String str) =>
    GetAllMoodsModel.fromJson(json.decode(str));

String getAllMoodsModelToJson(GetAllMoodsModel data) =>
    json.encode(data.toJson());

class GetAllMoodsModel {
  dynamic id;
  String? name;
  String? description;
  String? image;
  String? color;
  String? status;
  String? createdAt;
  String? updatedAt;

  GetAllMoodsModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.color,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAllMoodsModel.fromJson(Map<String, dynamic> json) =>
      GetAllMoodsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        color: json["color"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "color": color,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
