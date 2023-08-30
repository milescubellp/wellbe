import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/remote/base/api_response.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../provider/auth_provider.dart';
import '../utilites/app_constant.dart';

class MoodRepo {
  final DioClient dioClient;

  MoodRepo({required this.dioClient});
  Future<ApiResponse> getAllMoods(BuildContext context) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await Dio(BaseOptions(headers: {
        // "API-Key": "156c4675-9608-4591-b2ec-427503464aac",

        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${Provider.of<AuthProvider>(context, listen: false).getUserToken()}',
      })).get(
        '${AppConstant.baseUrl}${AppConstant.getAllMoods}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getAllSubMoods(int index) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getAllSubMoods}/${index}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getVideoMoodBased(int index) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getVideoMoodBase}/${index}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getMoodsToday() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getMoodToday}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getMoodsWeek() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getMoodWeek}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getMoodsMonth() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getMoodMonth}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> addMoodTracker(String moodId, String subMoodId,
      String journalItDown, BuildContext context,
      {String? userId}) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    debugPrint(
        '<<<<<<User id ${Provider.of<AuthProvider>(context, listen: false).userModel.id}>>>>>>');
    Map data = {
      'user_id': Provider.of<AuthProvider>(context, listen: false)
          .userModel
          .id
          .toString(),
      'mood_id': moodId,
      'sub_mood_id': subMoodId,
      'journal_it_down': journalItDown,
    };
    try {
      debugPrint('data:$data');
      response = await Dio(BaseOptions(headers: {
        // "API-Key": "156c4675-9608-4591-b2ec-427503464aac",

        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${Provider.of<AuthProvider>(context, listen: false).getUserToken()}',
      })).post('${AppConstant.baseUrl}${AppConstant.addMoodTracker}',
          data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> addUserAcademic(
    String userId,
    String moodId,
    String subMoodId,
    String title,
    BuildContext context, {
    String? questionIdOne,
    String? answerOne,
    String? questionIdTwo,
    String? answerTwo,
    String? questionIdThree,
    String? answerThree,
  }) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    Map data = {
      'user_id': userId,
      'mood_id': moodId,
      'sub_mood_id': subMoodId,
      'title': title,
      if (questionIdOne != null && answerOne != null)
        'question_id_1': questionIdOne,
      if (questionIdOne != null && answerOne != null) 'ans_1': answerOne,
      if (questionIdTwo != null && answerTwo != null)
        'question_id_2': questionIdTwo,
      if (questionIdTwo != null && answerTwo != null) 'ans_1': answerTwo,
      if (questionIdThree != null && answerThree != null)
        'question_id_3': questionIdThree,
      if (questionIdThree != null && answerThree != null) 'ans_1': answerThree,
    };
    try {
      // debugPrint('data:$data');
      response = await Dio(BaseOptions(headers: {
        // "API-Key": "156c4675-9608-4591-b2ec-427503464aac",

        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${Provider.of<AuthProvider>(context, listen: false).getUserToken()}',
      })).post(
        '${AppConstant.baseUrl}${AppConstant.addUserAcademic}',
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> addUserBreathing(String moodId, String subMoodId,
      String setTime, String endTime, BuildContext context) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    Map data = {
      'user_id': Provider.of<AuthProvider>(context, listen: false).userModel.id,
      'mood_id': moodId,
      'sub_mood_id': subMoodId,
      'set_time': setTime,
      'end_time': endTime,
    };
    try {
      response =
          await dioClient.post('${AppConstant.addUserBreathIn}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getAllQuestions(int index) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getAllQuestion}/${index}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getMoodDataRange(String startDate, String endDate) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    Map data = {
      'start_date': startDate,
      'end_date': endDate,
    };
    debugPrint('data: $data');
    try {
      response =
          await dioClient.post('${AppConstant.getMoodDataRange}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> addUserVideo(String moodId, String subMoodId,
      String videoId, BuildContext context) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    Map data = {
      'user_id': Provider.of<AuthProvider>(context, listen: false).userModel.id,
      'mood_id': moodId,
      'sub_mood_id': subMoodId,
      'video_id': videoId,
    };
    try {
      response =
          await dioClient.post('${AppConstant.addUserVideo}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
