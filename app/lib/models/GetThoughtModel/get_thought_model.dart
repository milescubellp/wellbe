// To parse this JSON data, do
//
//     final getThoughtModel = getThoughtModelFromJson(jsonString);

import 'dart:convert';

GetThoughtModel getThoughtModelFromJson(String str) =>
    GetThoughtModel.fromJson(json.decode(str));

String getThoughtModelToJson(GetThoughtModel data) =>
    json.encode(data.toJson());

class GetThoughtModel {
  int? id;
  String? categoryId;
  String? title;
  String? description;
  String? fileType;
  String? audioVideo;
  String? createdAt;
  String? updatedAt;

  GetThoughtModel({
    this.id,
    this.categoryId,
    this.title,
    this.description,
    this.fileType,
    this.audioVideo,
    this.createdAt,
    this.updatedAt,
  });

  factory GetThoughtModel.fromJson(Map<String, dynamic> json) =>
      GetThoughtModel(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        fileType: json["file_type"],
        audioVideo: json["audio_video"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
      };
}
