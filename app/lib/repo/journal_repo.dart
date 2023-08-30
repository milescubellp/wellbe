import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/auth_provider.dart';

import '../datasource/remote/base/api_response.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../utilites/app_constant.dart';

class JournalRepo {
  DioClient dioClient;
  JournalRepo({required this.dioClient});

  Future<ApiResponse> getJournals() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getJournals}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getJournalQuestionById(index) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getJournalsQuestionById}/$index',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getUserJournalQuestion() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getUserJournalQuestionAnswer}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> addUserJournalQuestion(
    String journalId,
    String title,
    String? questionId1,
    String? ans1,
    String? questionId2,
    String? ans2,
    String? questionId3,
    String? ans3,
    BuildContext context,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map<String, dynamic> data = {
        'user_id':
            '${Provider.of<AuthProvider>(context, listen: false).getUserID()}',
        'journal_id': journalId,
        'title': title,
        'question_id_1': questionId1,
        'ans_1': ans1,
        if (questionId2 != null) 'question_id_2': questionId2,
        if (ans2 != null) 'ans_2': ans2,
        if (questionId3 != null) 'question_id_3': questionId3,
        if (ans3 != null) 'ans_3': ans3,
      };

      debugPrint('data $data');

      response = await dioClient.post(
        '${AppConstant.addUserJournalQuestion}',
        data: data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
