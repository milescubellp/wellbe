import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../datasource/remote/base/api_response.dart';
import '../../dialogs/progress_dialog.dart';
import '../../models/GetPodcastsByMoods/get_podcasts_by_moods.dart';
import '../../models/GetPodcastsModel/get_podcasts_model.dart';
import '../../models/GetThoughtCategory/get_thought_category.dart';
import '../../models/GetThoughtModel/get_thought_model.dart';
import '../../models/GetThoughtsByCategoryModel/get_thoughts_by_category_model.dart';
import '../../models/GetUserThought/get_user_thought.dart';
import '../../repo/podcasts_repo.dart';
import '../../repo/thought_repo.dart';

class ThoughtProvider extends ChangeNotifier {
  final ThoughtRepo thoughtRepo;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isLoading2 = false;

  bool get isLoading2 => _isLoading2;

  ThoughtProvider({required this.thoughtRepo});
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GET METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //get thought
  List<GetThoughtModel> getThoughtModel = [];

  Future getThoughts(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading2 = true;
    if (isFirstTime) notifyListeners();
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await thoughtRepo.getThoughts();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      getThoughtModel.clear();
      getThoughtModel = [];
      newData['data']['data'].forEach((v) {
        getThoughtModel.add(GetThoughtModel.fromJson(v));
      });
      _isLoading2 = false;

      callback(true);
    } else {
      _isLoading2 = false;
      // _pr.hide();
      callback(false);
    }
    notifyListeners();
  }

  //  get thoughts  category
  List<GetThoughtCategoryModel> getThoughtCategoryModel = [];

  Future getThoughtCategory(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading = true;
    getThoughtCategoryModel.clear();
    getThoughtCategoryModel = [];
    // notifyListeners();
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await thoughtRepo.getThoughtCategory();
    if (apiResponse.response.data == null) {
      _isLoading = false;
    } else {
      Map newData = apiResponse.response.data;
      print("RESP $newData");
      if (newData["success"] == true) {
        // _pr.hide();

        newData['data']['data'].forEach((v) {
          getThoughtCategoryModel.add(GetThoughtCategoryModel.fromJson(v));
        });
        _isLoading = false;

        callback(true);
      } else {
        _isLoading = false;
        // _pr.hide();
        callback(false);
      }
    }
    notifyListeners();
  }

  //  get thoughts  category
  List<GetUserThoughtModel> getUserThoughtModel = [];

  Future getUserThoughts(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getUserThoughtModel.clear();
    getUserThoughtModel = [];
    _isLoading = true;
    // notifyListeners();
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await thoughtRepo.getUserThought();
    if (apiResponse.response.data == null) {
      _isLoading = false;
    } else {
      Map newData = apiResponse.response.data;
      print("RESP $newData");
      if (newData["success"] == true) {
        // _pr.hide();

        newData['data']['data'].forEach((v) {
          getUserThoughtModel.add(GetUserThoughtModel.fromJson(v));
        });
        _isLoading = false;

        callback(true);
      } else {
        _isLoading = false;
        // _pr.hide();
        callback(false);
      }
    }
    notifyListeners();
  }

//  get thoughts by category
  List<GetThoughtsByCategoryModel> getThoughtsByCategoryModel = [];

  Future getThoughtsByCategory(
      int index, Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getThoughtsByCategoryModel.clear();
    getThoughtsByCategoryModel = [];
    _isLoading = true;
    // notifyListeners();
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await thoughtRepo.getThoughtsByCategory(index);
    if (apiResponse.response.data == null) {
      _isLoading = false;
    } else {
      Map newData = apiResponse.response.data;
      print("RESP $newData");
      if (newData["success"] == true) {
        // _pr.hide();

        newData['data']['data'].forEach((v) {
          getThoughtsByCategoryModel
              .add(GetThoughtsByCategoryModel.fromJson(v));
        });
        _isLoading = false;

        callback(true);
      } else {
        _isLoading = false;
        // _pr.hide();
        callback(false);
      }
    }
    notifyListeners();
  }

  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<POST METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//add user podcast
  Future addUserThoughts(
      String thoughtId, Function callback, BuildContext context) async {
    // var _pr = ProgressDialog(context);
    // _pr.show('Processing');
    ApiResponse apiResponse =
        await thoughtRepo.addUserThoughts(thoughtId, context);

    if (apiResponse.response.data == null) {
      // _pr.hide();
      callback(
        false,
      );
    } else {
      Map newData = apiResponse.response.data;
      if (newData['success'] == true) {
        debugPrint('RESP:${newData}');
        // _pr.hide();
        callback(
          true,
        );
      } else {
        // _pr.hide();
        callback(false);
      }
    }
    notifyListeners();
  }
}
