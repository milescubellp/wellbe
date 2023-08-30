import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../datasource/remote/base/api_response.dart';
import '../../dialogs/progress_dialog.dart';
import '../../models/GetAppointmentModel/get_appointment.dart';
import '../../models/GetAvailableType/get_available_type.dart';
import '../../models/GetDoctorsModel/get_doctors_model.dart';
import '../../models/GetExpertise/get_expertise.dart';
import '../../models/GetLanguagesModel/get_languages_model.dart';
import '../../repo/doctor_user_repo.dart';

class DoctorUserProvider extends ChangeNotifier {
  final DoctorUserRepo doctorUserRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  DoctorUserProvider({required this.doctorUserRepo});

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GET METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// get doctors
  List<GetDoctorsModel> getDoctorsModels = [];

  Future getDoctors(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    _isLoading = true;

    getDoctorsModels.clear();
    getDoctorsModels = [];
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await doctorUserRepo.getDoctors();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      newData['data']['data'].forEach((v) {
        getDoctorsModels.add(GetDoctorsModel.fromJson(v));
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

  // get appointment
  List<GetAppointmentModel> getAppointmentModels = [];

  Future getAppointment(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getAppointmentModels.clear();
    getAppointmentModels = [];
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await doctorUserRepo.getAppointment();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      newData['data']['data'].forEach((v) {
        getAppointmentModels.add(GetAppointmentModel.fromJson(v));
      });

      callback(true);
    } else {
      _isLoading = false;
      // _pr.hide();
      callback(false);
    }
    notifyListeners();
  }

  // get language
  List<GetExpertiseModel> getExpertiseModels = [];

  Future getExpertise(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getExpertiseModels.clear();
    getExpertiseModels = [];
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await doctorUserRepo.getExpertise();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      newData['data']['data'].forEach((v) {
        getExpertiseModels.add(GetExpertiseModel.fromJson(v));
      });

      callback(true);
    } else {
      _isLoading = false;
      // _pr.hide();
      callback(false);
    }
    notifyListeners();
  }

  // get language
  List<GetLanguagesModel> getLanguagesModels = [];

  Future getLanguages(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getLanguagesModels.clear();
    getLanguagesModels = [];
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await doctorUserRepo.getLanguages();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      newData['data']['data'].forEach((v) {
        getLanguagesModels.add(GetLanguagesModel.fromJson(v));
      });

      callback(true);
    } else {
      _isLoading = false;
      // _pr.hide();
      callback(false);
    }
    notifyListeners();
  }

  List<GetAvailableTypeModel> getAvailableTypeModels = [];

  Future getAvailableType(Function callback, BuildContext context,
      {bool isFirstTime = false}) async {
    getAvailableTypeModels.clear();
    getAvailableTypeModels = [];
    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await doctorUserRepo.getAvailableType();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      // _pr.hide();
      newData['data']['data'].forEach((v) {
        getAvailableTypeModels.add(GetAvailableTypeModel.fromJson(v));
      });

      callback(true);
    } else {
      _isLoading = false;
      // _pr.hide();
      callback(false);
    }
    notifyListeners();
  }
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<POST METHOD APIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  List<GetAppointmentData> getAppointmentData = [];
  Future addAppointment(
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
      Function callback,
      BuildContext context,
      {bool isFirstTime = false}) async {
    var _pr = ProgressDialog(context);
    _pr.show('processing');
    getAppointmentData.clear();
    getAppointmentData = [];

    // var _pr = ProgressDialog(context);
    // _pr.show('processing');
    ApiResponse apiResponse = await doctorUserRepo.addAppointment(
        userId,
        doctorId,
        appointmentDate,
        sessionMode,
        timeSlot,
        sessionDuration,
        sessionPrice,
        clientDetails,
        clientMobile,
        under18,
        guardianName,
        guardianEmail,
        guardianMobile);

    if (apiResponse.response.data == null) {
      _pr.hide();
      callback(false, "Sorry there was an  error!");
    } else {
      Map newData = apiResponse.response.data;

      if (newData["success"] == true) {
        // _pr.hide();
        print("RESP $newData");

        getAppointmentData
            .add(GetAppointmentData.fromJson(newData['data']['data']));

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
