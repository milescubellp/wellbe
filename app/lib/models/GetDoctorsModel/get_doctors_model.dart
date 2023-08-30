// To parse this JSON data, do
//
//     final getDoctors = getDoctorsFromJson(jsonString);

import 'dart:convert';

GetDoctorsModel getDoctorsFromJson(String str) =>
    GetDoctorsModel.fromJson(json.decode(str));

String getDoctorsToJson(GetDoctorsModel data) => json.encode(data.toJson());

class GetDoctorsModel {
  dynamic id;
  dynamic userId;
  String? name;
  String? email;
  String? mobile;
  String? about;
  String? profilePic;
  String? experience;
  String? availability;
  String? expertise;
  String? language;
  String? availableType;
  String? consltFee;
  String? createdAt;
  String? updatedAt;

  GetDoctorsModel({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.mobile,
    this.about,
    this.profilePic,
    this.experience,
    this.availability,
    this.expertise,
    this.language,
    this.availableType,
    this.consltFee,
    this.createdAt,
    this.updatedAt,
  });

  factory GetDoctorsModel.fromJson(Map<String, dynamic> json) =>
      GetDoctorsModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        about: json["about"],
        profilePic: json["profile_pic"],
        experience: json["experience"],
        availability: json["availability"],
        expertise: json["expertise"],
        language: json["language"],
        availableType: json["available_type"],
        consltFee: json["conslt_fee"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "about": about,
        "profile_pic": profilePic,
        "experience": experience,
        "availability": availability,
        "expertise": expertise,
        "language": language,
        "available_type": availableType,
        "conslt_fee": consltFee,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
