import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../datasource/remote/base/api_response.dart';
import '../../dialogs/progress_dialog.dart';
import '../../models/GetJournalModel/get_journal_model.dart';
import '../../models/GetJournalQuestionById/get_journal_question_by_id.dart';
import '../../models/GetPodcastsByMoods/get_podcasts_by_moods.dart';
import '../../models/GetPodcastsModel/get_podcasts_model.dart';
import '../../repo/journal_repo.dart';

class JournalProvider extends ChangeNotifier {
  final JournalRepo journalRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  JournalProvider({required this.journalRepo});
  List<GetJournalModel> getJournalModel = [];
  List<Question> questions = [];
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GET METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//get journal question
  Future getJournal(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading = true;

    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await journalRepo.getJournals();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      getJournalModel.clear();
      getJournalModel = [];
      newData['data']['data'].forEach((v) {
        getJournalModel.add(GetJournalModel.fromJson(v));
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

//get journal question by id
  List<GetJournalQuestionbyId> getJournalQuestionByIdModel = [];

  Future getJournalQuestionById(
      int index, Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading = true;
    getJournalQuestionByIdModel.clear();
    getJournalQuestionByIdModel = [];

    var _pr = ProgressDialog(context);
    if (isFirstTime) _pr.show('processing');
    ApiResponse apiResponse = await journalRepo.getJournalQuestionById(index);

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      if (isFirstTime) _pr.hide();

      newData['data']['data'].forEach((v) {
        getJournalQuestionByIdModel.add(GetJournalQuestionbyId.fromJson(v));
      });
      _isLoading = false;

      callback(true);
    } else {
      _isLoading = false;
      if (isFirstTime) _pr.hide();
      callback(false);
    }
    notifyListeners();
  }

// get user journal question
  List<GetJournalModel> getUserJournalQuestionModel = [];

  Future getUserJournalQuestion(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading = true;

    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await journalRepo.getJournals();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      getJournalModel.clear();
      getJournalModel = [];
      newData['data']['data'].forEach((v) {
        getJournalModel.add(GetJournalModel.fromJson(v));
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
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<POST METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Future addUserJournalQuestion(
      String journalId,
      String title,
      String questionId1,
      String ans1,
      String? questionId2,
      String? ans2,
      String? questionId3,
      String? ans3,
      Function callback,
      BuildContext context) async {
    var _pr = ProgressDialog(context);
    _pr.show('processing');

    ApiResponse apiResponse = await journalRepo.addUserJournalQuestion(
        journalId,
        title,
        questionId1,
        ans1,
        questionId2,
        ans2,
        questionId3,
        ans3,
        context);

    if (apiResponse.response.data == null) {
      _pr.hide();
      callback(false, "Sorry there was an  error!");
    } else {
      Map newData = apiResponse.response.data;

      if (newData["success"] == true) {
        // _pr.hide();
        print("RESP $newData");

        _pr.hide();
        callback(true, "added successfully");
      } else {
        _isLoading = false;
        // _pr.hide();
        _pr.hide();
        callback(false, "error");
      }
    }
    notifyListeners();
  }
}
