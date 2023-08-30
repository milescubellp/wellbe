// To parse this JSON data, do
//
//     final getAvailableType = getAvailableTypeFromJson(jsonString);

import 'dart:convert';

GetAvailableTypeModel getAvailableTypeFromJson(String str) =>
    GetAvailableTypeModel.fromJson(json.decode(str));

String getAvailableTypeToJson(GetAvailableTypeModel data) =>
    json.encode(data.toJson());

class GetAvailableTypeModel {
  int? id;
  String? title;
  String? createdAt;
  dynamic updatedAt;

  GetAvailableTypeModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAvailableTypeModel.fromJson(Map<String, dynamic> json) =>
      GetAvailableTypeModel(
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
