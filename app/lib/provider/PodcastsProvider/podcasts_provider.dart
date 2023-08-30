import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:wellbe/dialogs/progress_dialog.dart';

import '../../datasource/remote/base/api_response.dart';
import '../../models/GetPodcastsByMoods/get_podcasts_by_moods.dart';
import '../../models/GetPodcastsModel/get_podcasts_model.dart';
import '../../repo/podcasts_repo.dart';

class PodcastsProvider extends ChangeNotifier {
  final PodcastsRepo podcastsRepo;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isLoading2 = false;

  bool get isLoading2 => _isLoading2;

  PodcastsProvider({required this.podcastsRepo});
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GET METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //get podcasts
  List<GetPodcastsModel> getPodcastsModel = [];

  Future getPodcasts(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading = true;
    // notifyListeners();
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await podcastsRepo.getPodcasts();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      getPodcastsModel.clear();
      getPodcastsModel = [];
      newData['data']['data'].forEach((v) {
        getPodcastsModel.add(GetPodcastsModel.fromJson(v));
      });
      _isLoading = false;

      callback(true);
    } else {
      _isLoading = false;
      // _pr.hide();
      callback(false);
    }
    notifyListeners();
  }

//  get podcasts by moods
  List<GetPodcastsByMoodsModel> getPodcastsByMoodsModel = [];

  Future getPodcastsByMoods(int index, Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading2 = true;
    // notifyListeners();
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await podcastsRepo.getPodcastsByMoods(index);
    if (apiResponse.response.data == null) {
      _isLoading2 = false;
    } else {
      Map newData = apiResponse.response.data;

      if (newData["success"] == true) {
        // _pr.hide();
        print("RESP $newData");
        getPodcastsByMoodsModel.clear();
        getPodcastsByMoodsModel = [];
        newData['data']['data'].forEach((v) {
          getPodcastsByMoodsModel.add(GetPodcastsByMoodsModel.fromJson(v));
        });
        _isLoading2 = false;

        callback(true);
      } else {
        _isLoading2 = false;
        // _pr.hide();
        callback(false);
      }
    }
    notifyListeners();
  }

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<POST METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//add user podcast
  Future addUserPodcast(
      String podcastAudioId, Function callback, BuildContext context) async {
    ApiResponse apiResponse =
        await podcastsRepo.addUserPodcast(podcastAudioId, context);

    if (apiResponse.response.data == null) {
      callback(false);
    } else {
      Map newData = apiResponse.response.data;
      if (newData['success'] == true) {
        print("RESP $newData");
        callback(
          true,
        );
      } else {
        callback(false);
      }
    }
    notifyListeners();
  }
}
