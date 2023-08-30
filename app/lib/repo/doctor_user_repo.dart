import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../datasource/remote/base/api_response.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../utilites/app_constant.dart';

class DoctorUserRepo {
  final DioClient dioClient;

  DoctorUserRepo({required this.dioClient});

  Future<ApiResponse> getDoctors() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      response = await dioClient.get('${AppConstant.getDoctors}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getAppointment() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      response = await dioClient.get('${AppConstant.getAppointment}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> addAppointment(
    int userId,
    String doctorId,
    String appointmentDate,
    String sessionMode,
    String timeSlot,
    String sessionDuration,
    String sessionPrice,
    String clientDetails,
    String clientMobile,
    String under18,
    String guardianName,
    String guardianEmail,
    String guardianMobile,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    Map<String, dynamic> data = {
      "user_id": userId,
      "doctor_id": doctorId,
      "appointment_date": appointmentDate,
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
    };
    try {
      debugPrint('data:${data}');
      response =
          await dioClient.post('${AppConstant.addAppointment}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

//get expertise
  Future<ApiResponse> getExpertise() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      response = await dioClient.get('${AppConstant.getExpertise}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  //get languages
  Future<ApiResponse> getLanguages() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      response = await dioClient.get('${AppConstant.getLanguages}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  //get available type
  Future<ApiResponse> getAvailableType() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      response = await dioClient.get('${AppConstant.getAvailableType}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
