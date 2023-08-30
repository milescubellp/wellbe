class GetPodcastsModel {
  int? id;
  dynamic userId;
  String? moodId;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<Podcastaudio>? podcastaudio;

  GetPodcastsModel({
    this.id,
    this.userId,
    this.moodId,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.podcastaudio,
  });

  factory GetPodcastsModel.fromJson(Map<String, dynamic> json) =>
      GetPodcastsModel(
        id: json["id"],
        userId: json["user_id"],
        moodId: json["mood_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        podcastaudio: json["podcastaudio"] == null
            ? []
            : List<Podcastaudio>.from(
                json["podcastaudio"].map((x) => Podcastaudio.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "mood_id": moodId,
        "title": title,
        "description": description,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "podcastaudio": podcastaudio == null
            ? []
            : List<dynamic>.from(podcastaudio!.map((x) => x.toJson())),
      };
}

class Podcastaudio {
  int? id;
  String? podcastId;
  String? title;
  String? description;
  String? audio;
  String? createdAt;
  String? updatedAt;

  Podcastaudio({
    this.id,
    this.podcastId,
    this.title,
    this.description,
    this.audio,
    this.createdAt,
    this.updatedAt,
  });

  factory Podcastaudio.fromJson(Map<String, dynamic> json) => Podcastaudio(
        id: json["id"],
        podcastId: json["podcast_id"],
        title: json["title"],
        description: json["description"],
        audio: json["audio"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "podcast_id": podcastId,
        "title": title,
        "description": description,
        "audio": audio,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
