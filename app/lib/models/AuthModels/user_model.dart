// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? role;
  String? name;
  String? code;
  String? email;
  String? mobile;
  String? mobileVerificationCode;
  dynamic profilePic;
  dynamic emailVerifiedAt;
  String? status;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.id,
    this.role,
    this.name,
    this.code,
    this.email,
    this.mobile,
    this.mobileVerificationCode,
    this.profilePic,
    this.emailVerifiedAt,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        code: json["code"],
        email: json["email"],
        mobile: json["mobile"],
        mobileVerificationCode: json["mobile_verification_code"],
        profilePic: json["profile_pic"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "name": name,
        "code": code,
        "email": email,
        "mobile": mobile,
        "mobile_verification_code": mobileVerificationCode,
        "profile_pic": profilePic,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
