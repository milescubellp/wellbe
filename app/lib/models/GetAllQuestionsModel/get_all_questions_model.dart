// To parse this JSON data, do
//
//     final getAllQuestionsModel = getAllQuestionsModelFromJson(jsonString);

import 'dart:convert';

GetAllQuestionsModel getAllQuestionsModelFromJson(String str) =>
    GetAllQuestionsModel.fromJson(json.decode(str));

String getAllQuestionsModelToJson(GetAllQuestionsModel data) =>
    json.encode(data.toJson());

class GetAllQuestionsModel {
  int? id;
  String? moodId;
  String? subMoodId;
  String? question;
  String? answer;
  String? status;
  String? createdAt;
  String? updatedAt;

  GetAllQuestionsModel({
    this.id,
    this.moodId,
    this.subMoodId,
    this.question,
    this.answer,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAllQuestionsModel.fromJson(Map<String, dynamic> json) =>
      GetAllQuestionsModel(
        id: json["id"],
        moodId: json["mood_id"],
        subMoodId: json["sub_mood_id"],
        question: json["question"],
        answer: json["answer"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mood_id": moodId,
        "sub_mood_id": subMoodId,
        "question": question,
        "answer": answer,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
