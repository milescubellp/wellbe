import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbe/utilites/app_constant.dart';

import '../../models/AuthModels/user_model.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
//  final SplashRepo splashRepo;

  ThemeProvider({required this.sharedPreferences}) {
    loadCurrentTheme();
  }

  bool isDarkTheme = false;

  bool get darkTheme => isDarkTheme;

  void toggleTheme(BuildContext context, {bool? value}) async {
    if (value != null) {
      isDarkTheme = value;
    } else {
      isDarkTheme = !isDarkTheme;
      if (UserModel().role != "ROLE_GUEST") {
        // await splashRepo.themeChange(isDarkTheme);
      }
    }
    sharedPreferences.setBool(AppConstant.theme, isDarkTheme);
    // AppColors.changeTheme(
    //     !_darkTheme ? splashRepo.getTheme(true) : splashRepo.getTheme(false));
    notifyListeners();
  }

  void loadCurrentTheme() async {
    isDarkTheme = sharedPreferences.getBool(AppConstant.theme) ?? false;
    //   notifyListeners();
  }
}
