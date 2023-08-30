import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbe/datasource/remote/base/api_response.dart';
import 'package:wellbe/datasource/remote/dio/dio_client.dart';
import 'package:wellbe/datasource/remote/exception/api_error_handler.dart';
import 'package:wellbe/utilites/app_constant.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> registerUser(
    String userName,
    String email,
    String password,
    String confirmPassword,
    String code,
    String role,
    String mobile,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map data = {
        'name': userName.toString().trim(),
        'email': email.toString().trim(),
        'password': password.toString().trim(),
        'confirm_password': confirmPassword.toString().trim(),
        'code': code.toString().trim(),
        'role': role.toString().trim(),
        'mobile': mobile.toString().trim()
      };
      print("date $data");
      response =
          await Dio().post("${AppConstant.baseUrl}${AppConstant.register}",
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
              data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> updateProfile(
    String userName,
    String email,
    String mobile,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map data = {
        'name': userName,
        'email': email,
        'mobile': mobile,
      };
      print("date $data");
      response =
          await dioClient.post('${AppConstant.updateProfile}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> changePassword(
    String password,
    String confirmPassword,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map data = {
        'password': password,
        'confirm_password': confirmPassword,
      };
      print("date $data");
      response =
          await dioClient.post('${AppConstant.changePassword}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> forgotPassword(
    String phoneNumber,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map data = {
        'mobile': phoneNumber,
      };
      print("date $data");
      response =
          await dioClient.post('${AppConstant.forgotPassword}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> verifyOtp(
    String phoneNo,
    String verificationOtp,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map data = {'mobile': phoneNo, 'otp': verificationOtp};
      print("date $data");
      response = await dioClient.post('${AppConstant.verifyOtp}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> resendOtp(
    String phoneNo,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map data = {
        'mobile': phoneNo,
      };
      print("date $data");
      response = await Dio(BaseOptions(headers: {
        // "API-Key": "156c4675-9608-4591-b2ec-427503464aac",

        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $getUserToken()',
      })).post('${AppConstant.baseUrl}${AppConstant.resendOtp}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> logIn(
    String email,
    String password,
  ) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map data = {
        'email': email,
        'password': password,
      };
      print("date $data");
      response = await Dio(BaseOptions(headers: {
        // "API-Key": "156c4675-9608-4591-b2ec-427503464aac",

        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $getUserToken()',
      })).post('${AppConstant.baseUrl}${AppConstant.login}', data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> logOut() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response =
          await dioClient.post('${AppConstant.baseUrl}${AppConstant.logout}',
              options: Options(
                  contentType: Headers.jsonContentType,
                  responseType: ResponseType.json,
                  followRedirects: false,
                  headers: {
                    "Accept": "application/json",
                  },
                  validateStatus: (_) => true));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getUserDetail() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      String token = getUserToken();
      debugPrint(token.toString());
      response = await Dio(BaseOptions(headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      })).get(
        '${AppConstant.baseUrl}${AppConstant.getUserInfo}',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      await sharedPreferences.setString(AppConstant.token, token);
    } catch (e) {
      rethrow;
    }
  }

  bool checkTokenExist() {
    return sharedPreferences.containsKey(AppConstant.token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstant.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.token);
  }

  Future<bool> clearToken() async {
    return sharedPreferences.remove(AppConstant.token);
  }

  Future<bool> clearUserID() async {
    return sharedPreferences.remove(AppConstant.userID);
  }

  Future<bool> clearEmail2() async {
    return sharedPreferences.remove(AppConstant.userEmail2);
  }

  Future<bool> clearUser() async {
    return sharedPreferences.remove(AppConstant.user);
  }

  // for  Remember Email
  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(AppConstant.userEmail, email);
      await sharedPreferences.setString(AppConstant.userPassword, password);
    } catch (e) {
      rethrow;
    }
  }

  // for  Remember Email
  Future<void> saveUserEmail(String email) async {
    try {
      await sharedPreferences.setString(AppConstant.userEmail2, email);
    } catch (e) {
      rethrow;
    }
  }

  // for
  Future<void> saveUserPassword(String password) async {
    try {
      await sharedPreferences.setString(AppConstant.userPassword, password);
    } catch (e) {
      rethrow;
    }
  }

  //

  Future<void> saveUserID(int userID) async {
    try {
      await sharedPreferences.setInt(AppConstant.userID, userID);
    } catch (e) {
      rethrow;
    }
  }

  int getUserID() {
    return sharedPreferences.getInt(AppConstant.userID) ?? -1;
  }

  Future<void> saveDeviceID(String deviceID) async {
    try {
      await sharedPreferences.setString(AppConstant.deviceID, deviceID);
    } catch (e) {
      rethrow;
    }
  }

  String getDeviceID() {
    return sharedPreferences.getString(AppConstant.deviceID) ?? "";
  }

  bool isExistsCustomerID() {
    return sharedPreferences.containsKey(AppConstant.userID);
  }

  String getUserEmail() {
    return sharedPreferences.getString(AppConstant.userEmail) ?? "";
  }

  String getUserEmail2() {
    return sharedPreferences.getString(AppConstant.userEmail2) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstant.userPassword) ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    await sharedPreferences.remove(AppConstant.userPassword);
    return await sharedPreferences.remove(AppConstant.userEmail);
  }

//   //
//
//   // for Domain
//   Future<void> savePath(String path) async {
//     try {
//       await sharedPreferences.setString(AppConstant.serverPath, path);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   String getPath() {
//     return sharedPreferences.getString(AppConstant.serverPath) ?? "";
//   }
//
//   Future<bool> clearServerConfig() async {
//     return await sharedPreferences.remove(AppConstant.serverPath);
//   }
}
