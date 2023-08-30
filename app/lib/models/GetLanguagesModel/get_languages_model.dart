// To parse this JSON data, do
//
//     final getLanguages = getLanguagesFromJson(jsonString);

import 'dart:convert';

GetLanguagesModel getLanguagesFromJson(String str) =>
    GetLanguagesModel.fromJson(json.decode(str));

String getLanguagesToJson(GetLanguagesModel data) => json.encode(data.toJson());

class GetLanguagesModel {
  int? id;
  String? title;
  String? createdAt;
  dynamic updatedAt;

  GetLanguagesModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory GetLanguagesModel.fromJson(Map<String, dynamic> json) =>
      GetLanguagesModel(
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
