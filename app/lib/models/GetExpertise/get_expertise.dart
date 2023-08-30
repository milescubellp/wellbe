// To parse this JSON data, do
//
//     final getExpertiseModel = getExpertiseModelFromJson(jsonString);

import 'dart:convert';

GetExpertiseModel getExpertiseModelFromJson(String str) =>
    GetExpertiseModel.fromJson(json.decode(str));

String getExpertiseModelToJson(GetExpertiseModel data) =>
    json.encode(data.toJson());

class GetExpertiseModel {
  int? id;
  String? title;
  String? createdAt;
  dynamic updatedAt;

  GetExpertiseModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory GetExpertiseModel.fromJson(Map<String, dynamic> json) =>
      GetExpertiseModel(
        id: json["id"],
        title: json["title"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
