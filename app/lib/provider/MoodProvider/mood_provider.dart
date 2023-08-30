import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbe/models/GetAllQuestionsModel/get_all_questions_model.dart';

import '../../datasource/remote/base/api_response.dart';
import '../../dialogs/progress_dialog.dart';
import '../../models/GetAllMoodsModel/get_all_moods_model.dart';
import '../../models/GetAllSubMoodsModel/get_all_sub_moods_model.dart';

import '../../models/GetMoodsTodayModel/get_moods_today.dart';
import '../../models/GetVideoMoodBasedModel/get_video_mood_based_model.dart';
import '../../repo/mood_repo.dart';
import '../../screens/homepage/MIndFul/breath_in.dart';
import '../../utilites/helper.dart';
import '../mindful_provider.dart';

class MoodProvider with ChangeNotifier {
  final MoodRepo moodRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  MoodProvider({required this.moodRepo});
  bool isApiErrorOccured = false;
  String moodId = '';
  String subMoodId = '';
  bool isCompleted = false;
  saveMoodId(value) {
    moodId = value;
    notifyListeners();
  }

  saveSubMoodId(value) {
    subMoodId = value;
    notifyListeners();
  }

// get highest emoji count
  GetMoodsTodayModel? selectedEmoji;
  GetMoodsTodayModel emojiWithHighestMoodCount(
      List<GetMoodsTodayModel> emojis) {
    debugPrint('<this method is called >');
    return emojis.reduce((a, b) => a.moodCount! > b.moodCount! ? a : b);
  }

  getHighestEmojiCount() {
    selectedEmoji = getMoodsTodayModels.isNotEmpty
        ? emojiWithHighestMoodCount(getMoodsTodayModels)
        : GetMoodsTodayModel();
    debugPrint('<<<<<selectedEmoji: $selectedEmoji>>>>>');
    notifyListeners();
  }
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GET METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  // get all moods
  List<GetAllMoodsModel> getAllMoodsModels = [];

  Future getAllMoods(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getAllMoodsModels.clear();
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await moodRepo.getAllMoods(context);

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      newData['data']['data'].forEach((v) {
        getAllMoodsModels.add(GetAllMoodsModel.fromJson(v));
      });

      callback(true);
    } else {
      _isLoading = false;
      // _pr.hide();
      callback(false);
    }
    notifyListeners();
  }

  // get all sub moods
  List<GetAllSubMoodsModel> getAllSubsMoodsModels = [];
  Future getAllSubMoods(
      int index, Function callback, BuildContext context) async {
    debugPrint(getAllSubsMoodsModels.toString());

    _isLoading = true;

    notifyListeners();
    ApiResponse apiResponse = await moodRepo.getAllSubMoods(index);

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      getAllSubsMoodsModels.clear();
      newData['data']['data'].forEach((v) {
        getAllSubsMoodsModels.add(GetAllSubMoodsModel.fromJson(v));
      });
      selectGetAllSubMoodsModel = getAllSubsMoodsModels[0];
      _isLoading = false;
      callback(
        true,
      );
    } else {
      _isLoading = false;

      callback(
        false,
      );
    }
    notifyListeners();
  }

  Future<File?> downloadAudio(String url, String fileName) async {
    return _downloadFile(url, 'audio_$fileName.mp3');
  }

  Future<File?> downloadVideo(String url, String fileName) async {
    return _downloadFile(url, 'video_$fileName.mp4');
  }

  Future<File?> _downloadFile(String url, String fileName) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      String savePath = '${dir.path}/$fileName';
      await dio.download(url, savePath, onReceiveProgress: (progress, total) {
        if (total != -1) {
          debugPrint(((progress / total) * 100).toInt().toString());
          if (progress == total) {
            isCompleted = true;
            notifyListeners();
          }
        }
      });

      File file = File(savePath);
      return file;
    } catch (e) {
      return null;
    }
  }

  // get video based
  List<GetVideoMoodBased> getVideoMoodBasedModels = [];
  // List<GetVideoMoodBased> getVideoMoodBasedModelsTemp = [];
  // List<Audio> getAudio = [];
  // List<Audio> getVideo = [];

  Future getVideoMoodBased(int index, Function callback, BuildContext context,
      {bool isVideo = false}) async {
    getVideoMoodBasedModels.clear();
    // isCompleted = false;
    // getVideoMoodBasedModelsTemp.clear();
    // getAudio.clear();
    // getAudio = [];
    // getVideo.clear();
    // getVideo = [];
    debugPrint(getAllSubsMoodsModels.toString());

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    ApiResponse apiResponse = await moodRepo.getVideoMoodBased(index);

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      newData['data']['data'].forEach((v) {
        getVideoMoodBasedModels.add(GetVideoMoodBased.fromJson(v));
        // getVideoMoodBasedModelsTemp.add(GetVideoMoodBased.fromJson(v));
      });
      // final tempList = isVideo
      //     ? getVideoMoodBasedModelsTemp[0].videos
      //     : getVideoMoodBasedModelsTemp[0].audios;
      // tempList!.forEach((element) async {
      //   String longString = "${element.title.toString()}";
      //   List<String> stringList = longString.split(RegExp("\\s+"));
      //   String stringItem = stringList.join(" ");
      //   String newLongString = stringItem.toString().replaceAll('#', ' #');
      //   if (prefs.getString('${element.link}') == null) {
      //     String? fileName = '';
      //     //  Uint8List? bytes;
      //     File? file = isVideo
      //         ? await downloadVideo(element.link.toString(), '${element.title}')
      //         : await downloadAudio(
      //             element.link.toString(), '${element.title}');
      //
      //     fileName = file!.path;
      //
      //     await prefs.setString('${element.link.toString()}', fileName);
      //     notifyListeners();
      //     String? filePath = prefs.getString('${element.link.toString()}');
      //     isVideo
      //         ? getVideo.add(Audio(
      //             title: element.title,
      //             type: element.type,
      //             id: element.id,
      //             createdAt: element.createdAt,
      //             link: element.link,
      //             filePath: filePath,
      //             recommendationId: element.recommendationId,
      //             updatedAt: element.updatedAt))
      //         : getAudio.add(Audio(
      //             title: element.title,
      //             type: element.type,
      //             id: element.id,
      //             createdAt: element.createdAt,
      //             link: element.link,
      //             filePath: filePath,
      //             recommendationId: element.recommendationId,
      //             updatedAt: element.updatedAt));
      //   } else {
      //     isCompleted = true;
      //     String? filePath = prefs.getString('${element.link.toString()}');
      //     debugPrint('<<<<<filePath:${filePath}>>>>>');
      //     getAudio.add(Audio(
      //         title: element.title,
      //         type: element.type,
      //         id: element.id,
      //         filePath: filePath,
      //         createdAt: element.createdAt,
      //         link: element.link,
      //         recommendationId: element.recommendationId,
      //         updatedAt: element.updatedAt));
      //   }
      // });

      _isLoading = false;
      isApiErrorOccured = false;

      callback(
        true,
      );
    } else {
      _isLoading = false;
      isApiErrorOccured = true;

      callback(
        false,
      );
    }
    notifyListeners();
  }

  GetAllSubMoodsModel selectGetAllSubMoodsModel = GetAllSubMoodsModel();
  onChangeMood(val) {
    selectGetAllSubMoodsModel = val;
    notifyListeners();
  }

  // get moods today
  List<GetMoodsTodayModel> getMoodsTodayModels = [];
  List<int> yPositions = [];

  Future getMoodsToday(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    // _isLoading = true;
    //
    // notifyListeners();
    yPositions.clear();
    getMoodsTodayModels.clear();
    getMoodsTodayModels = [];

    ApiResponse apiResponse = await moodRepo.getMoodsToday();

    // getMoodsTodayModels = [];

    Map newData = {};

    if (apiResponse.response.statusCode == 200) {
      newData = apiResponse.response.data;
      print("RESP $newData");
      newData['data']['data'].forEach((v) {
        getMoodsTodayModels.add(GetMoodsTodayModel.fromJson(v));
        getHighestEmojiCount();
      });
      getMoodsTodayModels.forEach((element) {
        yPositions.add(element.moodCount!.toInt());
        debugPrint('yposition :${element.moodCount!.toInt()}');
      });

      _isLoading = false;
      isApiErrorOccured = false;
    } else {
      _isLoading = false;
      isApiErrorOccured = true;
    }
    notifyListeners();
  }

  // get moods week

  Future getMoodsWeek(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getMoodsTodayModels.clear();
    getMoodsTodayModels = [];
    yPositions.clear();

    // if (isFirstTime) _isLoading = true;
    // notifyListeners();
    ApiResponse apiResponse = await moodRepo.getMoodsWeek();

    // getMoodsTodayModels = [];/
    Map newData = apiResponse.response.data;
    print("Moods weeks Resp: $newData");

    if (newData["success"] == true) {
      newData['data']['data'].forEach((v) {
        getMoodsTodayModels.add(GetMoodsTodayModel.fromJson(v));
        getHighestEmojiCount();
      });

      getMoodsTodayModels.forEach((element) {
        yPositions.add(element.moodCount!.toInt());
        debugPrint('yposition :${element.moodCount!.toInt()}');
      });
      _isLoading = false;
    } else {
      _isLoading = false;
      isApiErrorOccured = true;
    }
    notifyListeners();
  }

  // get moods month

  Future getMoodsMonth(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    // if (isFirstTime) _isLoading = true;
    // notifyListeners();
    getMoodsTodayModels.clear();
    getMoodsTodayModels = [];
    yPositions.clear();

    ApiResponse apiResponse = await moodRepo.getMoodsMonth();
    getMoodsTodayModels.clear();
    // getMoodsTodayModels = [];
    Map newData = apiResponse.response.data;

    print("RESP $newData");

    if (newData["success"] == true) {
      newData['data']['data'].forEach((v) {
        getMoodsTodayModels.add(GetMoodsTodayModel.fromJson(v));
        getHighestEmojiCount();
      });
      getMoodsTodayModels.forEach((element) {
        yPositions.add(element.moodCount!.toInt());
        debugPrint('yposition :${element.moodCount!.toInt()}');
      });
      _isLoading = false;
    } else {
      _isLoading = false;
      isApiErrorOccured = true;
    }
    notifyListeners();
  }

  // get all question
  List<GetAllQuestionsModel> getAllQuestionsModels = [];
  Future getAllQuestions(int index, Function callback, BuildContext context,
      {bool isChanged = false}) async {
    _isLoading = true;

    var _pr = ProgressDialog(context);
    if (isChanged) _pr.show('Processing');
    notifyListeners();
    ApiResponse apiResponse = await moodRepo.getAllQuestions(index);
    // _isLoading = false;
    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      getAllQuestionsModels.clear();
      newData['data']['data'].forEach((v) {
        getAllQuestionsModels.add(GetAllQuestionsModel.fromJson(v));
      });
      _isLoading = false;
      if (isChanged) _pr.hide();
      callback(true);
    } else {
      _isLoading = false;
      if (isChanged) _pr.hide();

      callback(false);
    }
    notifyListeners();
  }

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<POST METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //add user breathing
  Future addUserBreathing(String moodId, String subMoodId, String setTime,
      String endTime, Function callback, BuildContext context) async {
    _isLoading = true;
    var _pr = ProgressDialog(context);
    _pr.show('Processing');
    notifyListeners();
    ApiResponse apiResponse = await moodRepo.addUserBreathing(
        moodId, subMoodId, setTime, endTime, context);
    _isLoading = false;
    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      _pr.hide();
      callback(true, "added successfully");
    } else {
      _isLoading = false;
      _pr.hide();
      callback(false, newData['data']['message']);
    }
    notifyListeners();
  }

  //add user academic
  Future addUserAcademic(
    String userId,
    String moodId,
    String subMoodId,
    String title,
    Function callback,
    BuildContext context, {
    String? questionIdOne,
    String? answerOne,
    String? questionIdTwo,
    String? answerTwo,
    String? questionIdThree,
    String? answerThree,
  }) async {
    _isLoading = true;
    var _pr = ProgressDialog(context, isDismissible: true);
    _pr.show('Processing');
    // notifyListeners();
    ApiResponse apiResponse = await moodRepo.addUserAcademic(
        userId, moodId, subMoodId, title, context,
        answerOne: answerOne,
        answerTwo: answerTwo,
        answerThree: answerThree,
        questionIdOne: questionIdOne,
        questionIdTwo: questionIdTwo,
        questionIdThree: questionIdThree);
    _isLoading = false;
    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      _pr.hide();
      callback(true, "added successfully");
    } else {
      _isLoading = false;
      _pr.hide();
      callback(false, newData['data']['message']);
    }
    notifyListeners();
  }

  //add mood tracker
  Future addMoodTracker(String moodId, String subMoodId, String journalItDown,
      Function callback, BuildContext context,
      {String? userId}) async {
    var _pr = ProgressDialog(context);
    _pr.show('processing');
    notifyListeners();
    ApiResponse apiResponse = await moodRepo.addMoodTracker(
        moodId, subMoodId, journalItDown, context);

    Map newData = {};

    if (apiResponse.response.statusCode == 200) {
      newData = apiResponse.response.data;

      debugPrint("RESP $newData");
      _pr.hide();
      callback(true, "added successfully");
    } else {
      _pr.hide();
      callback(false, 'invalid data');
    }
    notifyListeners();
  }

//  add data range
  Future getMoodDataRange(String startDate, String endDate, Function callback,
      BuildContext context) async {
    getMoodsTodayModels.clear();
    getMoodsTodayModels = [];
    var _pr = ProgressDialog(context);
    _pr.show('processing');
    notifyListeners();
    ApiResponse apiResponse =
        await moodRepo.getMoodDataRange(startDate, endDate);

    Map newData = {};

    if (apiResponse.response.statusCode == 200) {
      newData = apiResponse.response.data;
      print("RESP $newData");
      newData['data']['data'].forEach((v) {
        getMoodsTodayModels.add(GetMoodsTodayModel.fromJson(v));
      });

      _pr.hide();

      callback(true, "data updated");
    } else {
      _pr.hide();
      callback(false, 'error');
    }
    notifyListeners();
  }

  //add user video
  Future addUserVideo(String moodId, String subMoodId, String videoId,
      Function callback, BuildContext context) async {
    _isLoading = true;

    notifyListeners();
    ApiResponse apiResponse =
        await moodRepo.addUserVideo(moodId, subMoodId, videoId, context);
    _isLoading = false;
    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      callback(true, "added successfully");
    } else {
      _isLoading = false;

      callback(false, newData['data']['message']);
    }
    notifyListeners();
  }
}
