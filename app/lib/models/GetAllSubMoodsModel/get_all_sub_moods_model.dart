// To parse this JSON data, do
//
//     final getAllSubMoodsModel = getAllSubMoodsModelFromJson(jsonString);

import 'dart:convert';

GetAllSubMoodsModel getAllSubMoodsModelFromJson(String str) => GetAllSubMoodsModel.fromJson(json.decode(str));

String getAllSubMoodsModelToJson(GetAllSubMoodsModel data) => json.encode(data.toJson());



class GetAllSubMoodsModel {
  int? id;
  String? moodId;
  String? subMoodName;
  String? subMoodColor;
  String? createdAt;
  String? updatedAt;

  GetAllSubMoodsModel({
    this.id,
    this.moodId,
    this.subMoodName,
    this.subMoodColor,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAllSubMoodsModel.fromJson(Map<String, dynamic> json) => GetAllSubMoodsModel(
    id: json["id"],
    moodId: json["mood_id"],
    subMoodName: json["sub_mood_name"],
    subMoodColor: json["sub_mood_color"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mood_id": moodId,
    "sub_mood_name": subMoodName,
    "sub_mood_color": subMoodColor,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
