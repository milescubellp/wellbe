// To parse this JSON data, do
//
//     final getVideoMoodBased = getVideoMoodBasedFromJson(jsonString);

import 'dart:convert';

GetVideoMoodBased getVideoMoodBasedFromJson(String str) =>
    GetVideoMoodBased.fromJson(json.decode(str));

String getVideoMoodBasedToJson(GetVideoMoodBased data) =>
    json.encode(data.toJson());

class GetVideoMoodBased {
  int? id;
  String? moodId;
  String? subMoodId;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? moodName;
  String? subMoodName;
  List<Audio>? videos;
  List<Audio>? audios;

  GetVideoMoodBased({
    this.id,
    this.moodId,
    this.subMoodId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.moodName,
    this.subMoodName,
    this.videos,
    this.audios,
  });

  factory GetVideoMoodBased.fromJson(Map<String, dynamic> json) =>
      GetVideoMoodBased(
        id: json["id"],
        moodId: json["mood_id"],
        subMoodId: json["sub_mood_id"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        moodName: json["mood_name"],
        subMoodName: json["sub_mood_name"],
        videos: json["videos"] == null
            ? []
            : List<Audio>.from(json["videos"]!.map((x) => Audio.fromJson(x))),
        audios: json["audios"] == null
            ? []
            : List<Audio>.from(json["audios"]!.map((x) => Audio.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mood_id": moodId,
        "sub_mood_id": subMoodId,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "mood_name": moodName,
        "sub_mood_name": subMoodName,
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "audios": audios == null
            ? []
            : List<dynamic>.from(audios!.map((x) => x.toJson())),
      };
}

class Audio {
  int? id;
  String? recommendationId;
  String? type;
  String? title;
  String? link;
  String? filePath;
  String? createdAt;
  String? updatedAt;

  Audio({
    this.id,
    this.recommendationId,
    this.type,
    this.title,
    this.link,
    this.filePath,
    this.createdAt,
    this.updatedAt,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        id: json["id"],
        recommendationId: json["recommendation_id"],
        type: json["type"],
        title: json["title"],
        link: json["link"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recommendation_id": recommendationId,
        "type": type,
        "title": title,
        "link": link,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
