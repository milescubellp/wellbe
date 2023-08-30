// To parse this JSON data, do
//
//     final getJournalQuestionbyId = getJournalQuestionbyIdFromJson(jsonString);

import 'dart:convert';

GetJournalQuestionbyId getJournalQuestionbyIdFromJson(String str) =>
    GetJournalQuestionbyId.fromJson(json.decode(str));

String getJournalQuestionbyIdToJson(GetJournalQuestionbyId data) =>
    json.encode(data.toJson());

class GetJournalQuestionbyId {
  int? id;
  String? journalId;
  String? question;
  String? answer;
  String? status;
  String? createdAt;
  String? updatedAt;

  GetJournalQuestionbyId({
    this.id,
    this.journalId,
    this.question,
    this.answer,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory GetJournalQuestionbyId.fromJson(Map<String, dynamic> json) =>
      GetJournalQuestionbyId(
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
