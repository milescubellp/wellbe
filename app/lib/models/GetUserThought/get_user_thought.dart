// To parse this JSON data, do
//
//     final getUserThoughtModel = getUserThoughtModelFromJson(jsonString);

import 'dart:convert';

GetUserThoughtModel getUserThoughtModelFromJson(String str) =>
    GetUserThoughtModel.fromJson(json.decode(str));

String getUserThoughtModelToJson(GetUserThoughtModel data) =>
    json.encode(data.toJson());

class GetUserThoughtModel {
  int? id;
  String? userId;
  String? thoughtId;
  String? createdAt;
  String? updatedAt;
  List<Thoughtdetail>? thoughtdetails;

  GetUserThoughtModel({
    this.id,
    this.userId,
    this.thoughtId,
    this.createdAt,
    this.updatedAt,
    this.thoughtdetails,
  });

  factory GetUserThoughtModel.fromJson(Map<String, dynamic> json) =>
      GetUserThoughtModel(
        id: json["id"],
        userId: json["user_id"],
        thoughtId: json["thought_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        thoughtdetails: json["thoughtdetails"] == null
            ? []
            : List<Thoughtdetail>.from(
                json["thoughtdetails"]!.map((x) => Thoughtdetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "thought_id": thoughtId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "thoughtdetails": thoughtdetails == null
            ? []
            : List<dynamic>.from(thoughtdetails!.map((x) => x.toJson())),
      };
}

class Thoughtdetail {
  int? id;
  String? categoryId;
  String? title;
  String? description;
  String? fileType;
  String? audioVideo;
  String? createdAt;
  String? updatedAt;

  Thoughtdetail({
    this.id,
    this.categoryId,
    this.title,
    this.description,
    this.fileType,
    this.audioVideo,
    this.createdAt,
    this.updatedAt,
  });

  factory Thoughtdetail.fromJson(Map<String, dynamic> json) => Thoughtdetail(
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
