import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  // THIS IS FOR SLIDER
  double sliderValue = 0.0;
  void onChangeSlider(value) {
    sliderValue = value;
    notifyListeners();
  }

  bool isProfilePage = false;
  void onProfilePageChanged(bool val) {
    isProfilePage = val;
    notifyListeners();
  }
}
