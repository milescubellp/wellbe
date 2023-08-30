// To parse this JSON data, do
//
//     final getAppointment = getAppointmentFromJson(jsonString);

import 'dart:convert';

GetAppointmentModel getAppointmentFromJson(String str) =>
    GetAppointmentModel.fromJson(json.decode(str));

String getAppointmentToJson(GetAppointmentModel data) =>
    json.encode(data.toJson());

class GetAppointmentModel {
  int? id;
  String? userId;
  String? doctorId;
  String? appointmentDate;
  String? sessionMode;
  String? timeSlot;
  String? sessionDuration;
  String? sessionPrice;
  String? under18;
  String? guardianName;
  String? guardianEmail;
  String? guardianMobile;
  String? clientDetails;
  String? clientMobile;
  String? createdAt;
  String? updatedAt;

  GetAppointmentModel({
    this.id,
    this.userId,
    this.doctorId,
    this.appointmentDate,
    this.sessionMode,
    this.timeSlot,
    this.sessionDuration,
    this.sessionPrice,
    this.under18,
    this.guardianName,
    this.guardianEmail,
    this.guardianMobile,
    this.clientDetails,
    this.clientMobile,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAppointmentModel.fromJson(Map<String, dynamic> json) =>
      GetAppointmentModel(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        appointmentDate: json["appointment_date"],
        sessionMode: json["session_mode"],
        timeSlot: json["time_slot"],
        sessionDuration: json["session_duration"],
        sessionPrice: json["session_price"],
        under18: json["under_18"],
        guardianName: json["guardian_name"],
        guardianEmail: json["guardian_email"],
        guardianMobile: json["guardian_mobile"],
        clientDetails: json["client_details"],
        clientMobile: json["client_mobile"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "appointment_date": appointmentDate,
        "session_mode": sessionMode,
        "time_slot": timeSlot,
        "session_duration": sessionDuration,
        "session_price": sessionPrice,
        "under_18": under18,
        "guardian_name": guardianName,
        "guardian_email": guardianEmail,
        "guardian_mobile": guardianMobile,
        "client_details": clientDetails,
        "client_mobile": clientMobile,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

//THIS MODEL  WILL SAVE DATA COMING FROM ADD APPOINTMENT API

// To parse this JSON data, do
//
//     final getAppointment = getAppointmentFromJson(jsonString);

GetAppointmentData GetAppointmentDataFromJson(String str) =>
    GetAppointmentData.fromJson(json.decode(str));

String GetAppointmentDataToJson(GetAppointmentData data) =>
    json.encode(data.toJson());

class GetAppointmentData {
  int? userId;
  String? doctorId;
  DateTime? appointmentDate;
  String? sessionMode;
  String? timeSlot;
  String? sessionDuration;
  String? sessionPrice;
  String? clientDetails;
  String? clientMobile;
  String? under18;
  String? guardianName;
  String? guardianEmail;
  String? guardianMobile;
  String? updatedAt;
  String? createdAt;
  int? id;

  GetAppointmentData({
    this.userId,
    this.doctorId,
    this.appointmentDate,
    this.sessionMode,
    this.timeSlot,
    this.sessionDuration,
    this.sessionPrice,
    this.clientDetails,
    this.clientMobile,
    this.under18,
    this.guardianName,
    this.guardianEmail,
    this.guardianMobile,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory GetAppointmentData.fromJson(Map<String, dynamic> json) =>
      GetAppointmentData(
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        appointmentDate: json["appointment_date"] == null
            ? null
            : DateTime.parse(json["appointment_date"]),
        sessionMode: json["session_mode"],
        timeSlot: json["time_slot"],
        sessionDuration: json["session_duration"],
        sessionPrice: json["session_price"],
        clientDetails: json["client_details"],
        clientMobile: json["client_mobile"],
        under18: json["under_18"],
        guardianName: json["guardian_name"],
        guardianEmail: json["guardian_email"],
        guardianMobile: json["guardian_mobile"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "doctor_id": doctorId,
        "appointment_date":
            "${appointmentDate!.year.toString().padLeft(4, '0')}-${appointmentDate!.month.toString().padLeft(2, '0')}-${appointmentDate!.day.toString().padLeft(2, '0')}",
        "session_mode": sessionMode,
        "time_slot": timeSlot,
        "session_duration": sessionDuration,
        "session_price": sessionPrice,
        "client_details": clientDetails,
        "client_mobile": clientMobile,
        "under_18": under18,
        "guardian_name": guardianName,
        "guardian_email": guardianEmail,
        "guardian_mobile": guardianMobile,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
