import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/auth_provider.dart';

import '../datasource/remote/base/api_response.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../utilites/app_constant.dart';

class ThoughtRepo {
  DioClient dioClient;
  ThoughtRepo({required this.dioClient});

  //  get thoughts

  Future<ApiResponse> getThoughts() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getThoughts}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  //  get thoughts
  Future<ApiResponse> getThoughtCategory() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getThoughtCategory}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  //  get user thoughts
  Future<ApiResponse> getUserThought() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getUserThoughts}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

//  get thougths by category
  Future<ApiResponse> getThoughtsByCategory(int index) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getThoughtsByCategory}/$index',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  //  add user thoughts

  Future<ApiResponse> addUserThoughts(
      String thoughtId, BuildContext context) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      String token =
          Provider.of<AuthProvider>(context, listen: false).getUserToken();
      Map data = {
        'user_id':
            '${Provider.of<AuthProvider>(context, listen: false).getUserID()}',
        'thought_id': thoughtId,
      };
      debugPrint('data $data');
      response = await Dio(BaseOptions(headers: {
        // "API-Key": "156c4675-9608-4591-b2ec-427503464aac",

        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      })).post(
        '${AppConstant.baseUrl}${AppConstant.addUserThoughts}',
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
