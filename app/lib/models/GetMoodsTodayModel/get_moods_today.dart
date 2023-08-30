// To parse this JSON data, do
//
//     final getMoodsTodayModel = getMoodsTodayModelFromJson(jsonString);

import 'dart:convert';

GetMoodsTodayModel getMoodsTodayModelFromJson(String str) =>
    GetMoodsTodayModel.fromJson(json.decode(str));

String getMoodsTodayModelToJson(GetMoodsTodayModel data) =>
    json.encode(data.toJson());

class GetMoodsTodayModel {
  dynamic id;
  String? name;
  String? description;
  String? image;
  String? color;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? moodCount;

  GetMoodsTodayModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.color,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.moodCount,
  });

  factory GetMoodsTodayModel.fromJson(Map<String, dynamic> json) =>
      GetMoodsTodayModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        color: json["color"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        moodCount: json["mood_count"],
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
        "mood_count": moodCount,
      };
}
