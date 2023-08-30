import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/datasource/remote/base/api_response.dart';
import 'package:wellbe/dialogs/progress_dialog.dart';
import 'package:wellbe/models/AuthModels/country_list_model.dart';
import 'package:wellbe/models/AuthModels/user_detail_model.dart';
import 'package:wellbe/models/AuthModels/user_model.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/repo/auth_repo.dart';
import 'package:wellbe/screens/AuthScreens/login_screen.dart';
import 'package:wellbe/utilites/helper.dart';

import '../models/GetAllMoodsModel/get_all_moods_model.dart';
import '../models/GetAllSubMoodsModel/get_all_sub_moods_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  //FOR SIGN UP OTP
  bool isSignUpPage = false;

  void onSignUpPageChange(val) {
    isSignUpPage = val;
  }

  // for slider
  int currentPage = 0;

  CarouselController buttonCarouselController = CarouselController();

  changeCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  changeSliderImage(BuildContext context) {
    if (currentPage == 3) {
      //buttonCarouselController.previousPage();
      Helper.toRemoveUntiScreen(context, LoginScreen());
    } else {
      buttonCarouselController.nextPage();
    }
    //buttonCarouselController.jumpToPage(index);
    notifyListeners();
  }

  TabController? controller;

  tabFuncation(TickerProvider vsync) {
    controller = TabController(length: 2, vsync: vsync);
    controller!.addListener(tabIndexChange);
  }

  tabIndexChange() {
    notifyListeners();
  }

  tabNavigate(int index, {bool? isInitial}) {
    controller!.animateTo(index);
    //  notifyListeners();
  }

  TabController? profileTabController;

  profileTabFuncation(TickerProvider vsync) {
    profileTabController = TabController(length: 4, vsync: vsync);
    profileTabController!.addListener(profileTabIndexChange);
  }

  profileTabIndexChange() {
    notifyListeners();
  }

  profileTabNavigate(int index, {bool? isInitial}) {
    profileTabController!.animateTo(index);
    //  notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool isToggle = true;
  bool isToggle1 = true;
  bool isToggle2 = true;
  int tapIndex = 0;
  String tokenResetPassword = '';

  toggleDone({int? index}) {
    if (index == 0) {
      isToggle = !isToggle;
    } else if (index == 1) {
      isToggle1 = !isToggle1;
    } else if (index == 2) {
      isToggle2 = !isToggle2;
    }
    notifyListeners();
  }

  // toggleDone() {
  //     isToggle = !isToggle;
  //   notifyListeners();
  // }

  // for Sign in Section
  changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // register user
  Future registerUser(
      String userName,
      String email,
      String password,
      String confirmPassword,
      String code,
      String role,
      String mobile,
      Function callback,
      BuildContext context) async {
    var _pr = ProgressDialog(context);
    _isLoading = true;
    _pr.show('Processing');
    notifyListeners();
    ApiResponse apiResponse = await authRepo.registerUser(
      userName,
      email,
      password,
      confirmPassword,
      code,
      role,
      mobile,
    );
    _isLoading = false;
    Map newData = {};

    if (apiResponse.response.statusCode == 200) {
      Map newData = apiResponse.response.data;
      print("RESP $newData");
      authRepo.saveUserToken(newData['data']['token']);
      debugPrint('<<<<<<Registered Token: ${authRepo.getUserToken()}>>>>>>>>>');
      _isLoading = false;
      _pr.hide();
      callback(true, "code sent");
    } else {
      _isLoading = false;
      _pr.hide();
      callback(false, 'registertation failed');
    }
    notifyListeners();
  }

  // update profile
  Future updateProfile(String userName, String email, String mobile,
      Function callback, BuildContext context) async {
    var _pr = ProgressDialog(context);
    _isLoading = true;
    _pr.show('Processing');
    notifyListeners();
    ApiResponse apiResponse = await authRepo.updateProfile(
      userName,
      email,
      mobile,
    );

    Map newData = {};
    if (apiResponse.response.statusCode == 200) {
      newData = apiResponse.response.data;
      print("RESP $newData");

      debugPrint(
          '<<<<<<<<Registered Token: ${authRepo.getUserToken()}>>>>>>>>>');
      await getUserDetails(context);
      _isLoading = false;
      _pr.hide();
      callback(true, newData['message']);
    } else {
      _isLoading = false;
      _pr.hide();
      callback(false, 'Updating failed');
    }
    notifyListeners();
  }

  // change password
  Future forgotPassword(
      String phoneNumber, Function callback, BuildContext context) async {
    var _pr = ProgressDialog(context);
    _isLoading = true;
    _pr.show('Processing');
    notifyListeners();
    ApiResponse apiResponse = await authRepo.forgotPassword(phoneNumber);

    Map newData = {};

    if (apiResponse.response.statusCode == 200) {
      newData = apiResponse.response.data;
      print("RESP $newData");
      if (authRepo.checkTokenExist()) {
        clear();
        authRepo.saveUserToken(newData['data']['token']);
      } else {
        authRepo.saveUserToken(newData['data']['token']);
      }

      debugPrint(
          '<<<<<<<<<<<<<<Forgot password token: ${authRepo.saveUserToken(newData['data']['token'])}');
      _isLoading = false;
      _pr.hide();
      callback(true, newData['message']);
    } else {
      _isLoading = false;
      _pr.hide();
      callback(false, 'Phone number is not Registered');
    }
    notifyListeners();
  }

  // change password
  Future resetPassword(String password, String confirmPassword,
      Function callback, BuildContext context) async {
    var _pr = ProgressDialog(context);
    _isLoading = true;
    _pr.show('Processing');
    notifyListeners();
    ApiResponse apiResponse =
        await authRepo.changePassword(password, confirmPassword);

    Map newData = {};

    if (apiResponse.response.statusCode == 200) {
      newData = apiResponse.response.data;
      print("RESP $newData");
      _isLoading = false;
      _pr.hide();
      callback(true, newData['message']);
    } else {
      _isLoading = false;
      _pr.hide();
      callback(false, 'invalid password');
    }
    notifyListeners();
  }

  // verify otp
  bool isVerified = false;
  verifyNumber(val) {
    isVerified = val;
    notifyListeners();
  }

  Future verifyOtp(String phoneNo, String verfyOtp, Function callback,
      BuildContext context) async {
    var _pr = ProgressDialog(context);
    _isLoading = true;
    _pr.show('Processing');
    notifyListeners();
    ApiResponse apiResponse = await authRepo.verifyOtp(
      phoneNo,
      verfyOtp,
    );

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      if (authRepo.checkTokenExist()) {
        clear();
        authRepo.saveUserToken(newData['data']['token']);
        authRepo.saveUserID(newData['data']['data']['id']);
      } else {
        authRepo.saveUserToken(newData['data']['token']);
        authRepo.saveUserID(newData['data']['data']['id']);
      }
      debugPrint('saved otp token:${getUserToken()}');
      await getUserDetails(context);
      Provider.of<MoodProvider>(context, listen: false)
          .getAllMoodsModels
          .clear();
      await Provider.of<MoodProvider>(context, listen: false)
          .getAllMoods((status) {}, context);

      _isLoading = false;
      _pr.hide();
      debugPrint(
          '<<<<<<<<Verify Opt token:  ${authRepo.getUserToken()}>>>>>>>>>');

      callback(true, newData['message']);
    } else {
      _isLoading = false;
      callback(false, 'Ottp verifcation failed');
      _pr.hide();
    }
    notifyListeners();
  }

  // login
  Future login(String email, String password, Function callback,
      BuildContext context) async {
    var _pr = ProgressDialog(context);
    _pr.show('processing');
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.logIn(
      email,
      password,
    );

    Map newData = {};
    debugPrint('status Code: ${apiResponse.response.statusCode}');
    debugPrint('errror: ${apiResponse.error}');
    if (apiResponse.response.statusCode == 200) {
      newData = apiResponse.response.data;
      print("RESP $newData");
      if (authRepo.checkTokenExist()) {
        clear();
        authRepo.saveUserToken(newData['data']['token']);
        authRepo.saveUserID(newData['data']['data']['id']);
      } else {
        authRepo.saveUserToken(newData['data']['token']);
        authRepo.saveUserID(newData['data']['data']['id']);
      }

      debugPrint(
          '<<<<<<<<Login Opt token:  ${authRepo.getUserToken()}>>>>>>>>>');
      await getUserDetails(context);
      Provider.of<MoodProvider>(context, listen: false)
          .getAllMoodsModels
          .clear();
      await Provider.of<MoodProvider>(context, listen: false)
          .getAllMoods((status) {}, context);

      _isLoading = false;
      _pr.hide();
      callback(true, newData['message']);
    } else {
      _isLoading = false;
      await _pr.hide();
      callback(false, 'Wrong email or password');

      // callback(false, captureApiErrors();
    }
    notifyListeners();
  }

  String captureApiErrors(dynamic statusCode) {
    if (statusCode >= 400 && statusCode < 500) {
      return 'Client Error: unauthorized';
      // Handle client-side errors (4xx) accordingly
    } else if (statusCode >= 500 && statusCode < 600) {
      return 'Server Error: timesout';
      // Handle server-side errors (5xx) accordingly
    } else {
      // Handle other types of errors, such as network errors
      return 'Network Error: Your network is slow';
    }

    // Handle the error based on the status code
  }

  // logout
  Future logout(Function callback, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.logOut();
    _isLoading = false;
    Map newData = jsonDecode(apiResponse.response.data);
    print("RESP $newData");
    if (newData["success"] == true) {
      callback(true, newData['message']);
    } else {
      _isLoading = false;
      callback(false, 'Error in loging out');
    }
    notifyListeners();
  }

  // get user details
  UserModel userModel = UserModel();
  Future getUserDetails(BuildContext context) async {
    _isLoading = true;
    //  notifyListeners();
    ApiResponse apiResponse = await authRepo.getUserDetail();

    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      userModel = UserModel.fromJson(newData['data']['data']);
      _isLoading = false;
    } else {
      _isLoading = false;
    }
    notifyListeners();
  }

  // resend otp
  Future resendOtp(
      String phoneNo, Function callback, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.resendOtp(
      phoneNo,
    );
    _isLoading = false;
    Map newData = apiResponse.response.data;
    print("RESP $newData");
    if (newData["success"] == true) {
      if (authRepo.checkTokenExist()) {
        clear();
        authRepo.saveUserToken(newData['data']['token']);
      } else {
        authRepo.saveUserToken(newData['data']['token']);
      }

      debugPrint(
          '<<<<<<<<Resend Opt token:  ${authRepo.getUserToken()}>>>>>>>>>');

      callback(true, newData['message']);
    } else {
      _isLoading = false;
      callback(false, 'Error');
    }
    notifyListeners();
  }
  // // for sign up section
  //
  // Future signUPWithPhone(String dob, String username, String phone,
  //     bool? userPhoneCheck, Function callback, BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo
  //       .signUpWithPhone(dob, username, phone, userPhoneCheck: userPhoneCheck);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("new data ${newData}");
  //   if (newData["code"] == 200) {
  //     if (authRepo.checkTokenExist()) {
  //       clear();
  //     } else {}
  //     // var authTokn =newData['msg']['User']["auth_token"];
  //     // print("$authTokn");
  //     authRepo.saveUserToken(newData['msg']['User']["auth_token"]);
  //     authRepo.saveUserID(int.parse(newData['msg']['User']['id'].toString()));
  //
  //     _isLoading = false;
  //     // authRepo.saveUserEmail(apiResponse.response.data['value']['email']);
  //     // authRepo.saveUserPassword(password);
  //     // await getUserInfo(context);
  //     callback(true, 'User Registered Successfully');
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // //
  // Future otpCode(String phone, String verify, String code, bool isVerified,
  //     Function callback, BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.verifyPhoneNo(phone, verify,
  //       code: code, isVerified: isVerified);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("RESP $newData");
  //   if (newData["code"] == 200) {
  //     callback(true, "code sent");
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // Future signUPWithEmail(
  //     String dob,
  //     String username,
  //     String email,
  //     String password,
  //     bool? isRegistered,
  //     Function callback,
  //     BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.signUpWithEmail(
  //       dob, username, email, password,
  //       isRegistered: isRegistered);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("new data ${newData}");
  //   if (newData["code"] == 200) {
  //     if (authRepo.checkTokenExist()) {
  //       clear();
  //     } else {}
  //     // var authTokn =newData['msg']['User']["auth_token"];
  //     // print("$authTokn");
  //     authRepo.saveUserToken(newData['msg']['User']["auth_token"]);
  //     authRepo.saveUserID(int.parse(newData['msg']['User']['id'].toString()));
  //     //await otpCode(phone, "0", "", false, (){}, context);
  //     _isLoading = false;
  //
  //     // authRepo.saveUserEmail(apiResponse.response.data['value']['email']);
  //     // authRepo.saveUserPassword(password);
  //     // await getUserInfo(context);
  //     callback(true, 'User Registered Successfully');
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // Future signInWithEmail(String email, String password, Function callback,
  //     BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.signInWithEmail(email, password);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("new data ${newData}");
  //   if (newData["code"] == 200) {
  //     if (authRepo.checkTokenExist()) {
  //       clear();
  //     } else {}
  //     // var authTokn =newData['msg']['User']["auth_token"];
  //     // print("$authTokn");
  //     authRepo.saveUserToken(newData['msg']['User']["auth_token"]);
  //     authRepo.saveUserID(int.parse(newData['msg']['User']['id'].toString()));
  //
  //     //await otpCode(phone, "0", "", false, (){}, context);
  //     _isLoading = false;
  //     // authRepo.saveUserEmail(apiResponse.response.data['value']['email']);
  //     // authRepo.saveUserPassword(password);
  //     // await getUserInfo(context);
  //     callback(true, 'User Registered Successfully');
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // //
  // Future otpEmailCode(String email, String code, bool isVerified,
  //     Function callback, BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse =
  //       await authRepo.verifyEmail(email, code: code, isVerified: isVerified);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("RESP $newData");
  //   if (newData["code"] == 200) {
  //     callback(true, "code sent");
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // UserDetailModel userDetailModel = UserDetailModel();
  //
  // Future showUserDetail(BuildContext context) async {
  //   _isLoading = true;
  //   ApiResponse apiResponse = await authRepo.showUserDetail();
  //   userDetailModel = UserDetailModel();
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("RESP $newData");
  //   if (newData["code"] == 200) {
  //     userDetailModel = UserDetailModel.fromJson(newData["msg"]);
  //     _isLoading = false;
  //
  //     notifyListeners();
  //   } else {
  //     _isLoading = false;
  //     // notifyListeners();
  //   }
  // }
  // //
  //
  // Future forgotPasswordWithEmail(
  //     String email, Function callback, BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.forgotPasswordWithEmail(email);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("new data ${newData}");
  //   if (newData["code"] == 200) {
  //     _isLoading = false;
  //     callback(true, newData['msg']);
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // Future forgotEmailOtpCode(String email, String code, Function callback,
  //     BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse =
  //       await authRepo.forgotPasswordEmailVerifyOTp(email, code);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("RESP $newData");
  //   if (newData["code"] == 200) {
  //     UserModel().email = email;
  //     callback(true, "code sent");
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // //Change Password
  // Future resetPassword(String email, String password, Function callback,
  //     BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse =
  //       await authRepo.resetPasswordWithEmail(email, password);
  //   _isLoading = false;
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("RESP $newData");
  //   if (newData["code"] == 200) {
  //     callback(true, "code sent");
  //   } else {
  //     _isLoading = false;
  //     callback(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }
  //
  // Future updateProfile({
  //   String? fName,
  //   String? lName,
  //   String? bio,
  //   String? website,
  //   String? private,
  //   String? username,
  //   String? gender,
  //   Function? callback,
  //   BuildContext? context,
  // }) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.updateProfile(
  //       fName: fName,
  //       lName: lName,
  //       bio: bio,
  //       website: website,
  //       private: private,
  //       username: username,
  //       gender: gender);
  //
  //   Map newData = jsonDecode(apiResponse.response.data);
  //   print("RESP $newData");
  //   if (newData["code"] == 200) {
  //     await showUserDetail(context!);
  //     _isLoading = false;
  //     callback!(true, "code sent");
  //   } else {
  //     _isLoading = false;
  //     callback!(false, newData['msg']);
  //   }
  //   notifyListeners();
  // }

  int timeCount = 200;

  resetTimeCount() {
    timeCount = 200;
  }

  Timer? timer;

  startTimer(BuildContext context) {
    timeCount = 200;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeCount <= 0) {
        cancelTimer(context);
      } else {
        timeCount--;
        notifyListeners();
      }
    });
  }

  cancelTimer(BuildContext context) {
    if (timer != null) timer!.cancel();
    notifyListeners();
  }

  List<CountryListModel> countryListModel = [];
  List<CountryListModel> countryListTempModel = [];

  getCountriesFromAsset(BuildContext context) async {
    _isLoading = true;
    countryListModel = [];
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/jsonFiles/country.json");
    final jsonResult = jsonDecode(data); //latest Dart
    jsonResult.forEach((element) {
      countryListModel.add(CountryListModel.fromJson(element));
    });
    countryListModel.forEach((element) {
      if (element.code == "92") {
        selectedCountryModel = element;
      }
    });
    countryListTempModel.addAll(countryListModel);
    print("json result ${jsonResult}");
    _isLoading = false;
    notifyListeners();
  }

  CountryListModel selectedCountryModel = CountryListModel();

  onSelectCountry(CountryListModel countryListModel) {
    selectedCountryModel = countryListModel;
    notifyListeners();
  }

  //

  searchCountry(String search) {
    notifyListeners();
    print("search $search");
    countryListModel.clear();
    countryListModel = [];
    if (search.isEmpty) {
      countryListModel.addAll(countryListTempModel);
    } else {
      countryListTempModel.forEach((element) {
        if ((element.country!
                .toLowerCase()
                .toString()
                .contains(search.toLowerCase())) ||
            (element.country!
                .toUpperCase()
                .toString()
                .contains(search.toUpperCase())) ||
            (element.iso!.toLowerCase().contains(search.toString())) ||
            (element.iso!.toUpperCase().contains(search.toString())) ||
            (element.code!.toString().contains(search.toString()))) {
          countryListModel.add(element);
        }
      });
    }
    notifyListeners();
  }

  int getUserID() {
    return authRepo.getUserID();
  }

  // for Remember Me Section

  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    notifyListeners();
  }

  void saveUserEmailAndPassword(String email, String password) {
    authRepo.saveUserEmailAndPassword(email, password);
  }

  String getUserEmail() {
    return authRepo.getUserEmail();
  }

  Future<bool> clearUserEmailAndPassword() async {
    return authRepo.clearUserEmailAndPassword();
  }

  String getUserPassword() {
    return authRepo.getUserPassword();
  }

  // for user Section
  String getUserToken() {
    return authRepo.getUserToken();
  }

  // for Device ID
  void saveDeviceID(String deviceID) {
    authRepo.saveDeviceID(deviceID);
  }

  String getDeviceID() {
    return authRepo.getDeviceID();
  }

  // for Email
  String getEmail2() {
    return authRepo.getUserEmail2();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  clear() {
    clearUserID();
    clearSharedData();
  }

  clearSharedData() async {
    if (authRepo.isLoggedIn()) await authRepo.clearToken();
  }

  clearUserID() async {
    if (authRepo.isExistsCustomerID()) await authRepo.clearUserID();
  }

  int selectResetPasswordOption = 0;

  initializeResetPassword() {
    selectResetPasswordOption = 0;
  }

  void changeResetPasswordOption(int value) {
    selectResetPasswordOption = value;
    notifyListeners();
  }

//   onServerConfig(String path, BuildContext context) {
//     authRepo.savePath(path);
//     Helper.showSnack(context, "Your Server Configuration Successfully");
//     notifyListeners();
//   }
//
//   //
//   String getServerConfigPath() {
//     return authRepo.getPath();
//   }
//
//   clearServerConfig(BuildContext context) {
//     authRepo.clearServerConfig();
//     Helper.showSnack(context, "Clear Server Configuration");
//     notifyListeners();
//   }
}
