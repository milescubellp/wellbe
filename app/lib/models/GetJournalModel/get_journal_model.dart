// To parse this JSON data, do
//
//     final getJournalModel = getJournalModelFromJson(jsonString);

import 'dart:convert';

GetJournalModel getJournalModelFromJson(String str) =>
    GetJournalModel.fromJson(json.decode(str));

String getJournalModelToJson(GetJournalModel data) =>
    json.encode(data.toJson());

class GetJournalModel {
  int? id;
  String? userId;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<Question>? questions;

  GetJournalModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  factory GetJournalModel.fromJson(Map<String, dynamic> json) =>
      GetJournalModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"]!.map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "questions": questions == null
            ? []
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}

class Question {
  int? id;
  String? journalId;
  String? question;
  String? answer;
  String? status;
  String? createdAt;
  String? updatedAt;

  Question({
    this.id,
    this.journalId,
    this.question,
    this.answer,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        journalId: json["journal_id"],
        question: json["question"],
        answer: json["answer"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "journal_id": journalId,
        "question": question,
        "answer": answer,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
