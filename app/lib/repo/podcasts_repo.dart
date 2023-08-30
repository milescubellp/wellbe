import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/auth_provider.dart';

import '../datasource/remote/base/api_response.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../utilites/app_constant.dart';

class PodcastsRepo {
  DioClient dioClient;
  PodcastsRepo({required this.dioClient});

  //  get podcasts

  Future<ApiResponse> getPodcasts() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getPodcasts}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

//  get podcasts by mood
  Future<ApiResponse> getPodcastsByMoods(int index) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(
        '${AppConstant.getPodcastsByMoods}/$index',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

//  add user podcast

  Future<ApiResponse> addUserPodcast(
      String podcastAudioId, BuildContext context) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      String token =
          Provider.of<AuthProvider>(context, listen: false).getUserToken();
      Map data = {
        "user_id":
            '${Provider.of<AuthProvider>(context, listen: false).getUserID()}',
        "podcast_audio_id": podcastAudioId,
      };
      debugPrint('data $data');
      response = await Dio(BaseOptions(headers: {
        // "API-Key": "156c4675-9608-4591-b2ec-427503464aac",

        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      })).post(
        '${AppConstant.baseUrl}${AppConstant.addUserPodcast}',
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
