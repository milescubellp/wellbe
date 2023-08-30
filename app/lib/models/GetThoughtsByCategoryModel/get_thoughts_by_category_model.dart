// To parse this JSON data, do
//
//     final getThoughtsByCategoryModel = getThoughtsByCategoryModelFromJson(jsonString);

import 'dart:convert';

GetThoughtsByCategoryModel getThoughtsByCategoryModelFromJson(String str) =>
    GetThoughtsByCategoryModel.fromJson(json.decode(str));

String getThoughtsByCategoryModelToJson(GetThoughtsByCategoryModel data) =>
    json.encode(data.toJson());

class GetThoughtsByCategoryModel {
  int? id;
  String? categoryId;
  String? title;
  String? description;
  String? fileType;
  String? audioVideo;
  String? createdAt;
  String? updatedAt;
  List<CategoryInfo>? categoryInfo;

  GetThoughtsByCategoryModel({
    this.id,
    this.categoryId,
    this.title,
    this.description,
    this.fileType,
    this.audioVideo,
    this.createdAt,
    this.updatedAt,
    this.categoryInfo,
  });

  factory GetThoughtsByCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetThoughtsByCategoryModel(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        fileType: json["file_type"],
        audioVideo: json["audio_video"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        categoryInfo: json["category_info"] == null
            ? []
            : List<CategoryInfo>.from(
                json["category_info"]!.map((x) => CategoryInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "file_type": fileType,
        "audio_video": audioVideo,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category_info": categoryInfo == null
            ? []
            : List<dynamic>.from(categoryInfo!.map((x) => x.toJson())),
      };
}

class CategoryInfo {
  int? id;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryInfo({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryInfo.fromJson(Map<String, dynamic> json) => CategoryInfo(
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
