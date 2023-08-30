import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  //THIS IS USED FOR CONTROLLING MINDFUL LANDING PAGE
  bool isMindfulLandingPage = false;

  void changedLandingPage(bool val) {
    isMindfulLandingPage = val;
    notifyListeners();
  }

  //THIS IS USED FOR CONTROLLING MOODSPACE LANDING PAGE
  bool isMoodSpaceLandingPage = false;
  void changedMoodSpaceLandingPage(bool val) {
    isMoodSpaceLandingPage = val;
    notifyListeners();
  }

  //THIS IS FOR EMOTION ICON CAROUSEL EMOJIS CONTROLL
  int selectedTab = 0;
  void selectedTabChanged(int index) {
    selectedTab = index;
    notifyListeners();
  }

  //THIS IS FOR MOOD TRACKER SCREEN
  int moodTrackerIndex = 0;
  void moodTrackerIndexChanged(int index) {
    moodTrackerIndex = index;
    notifyListeners();
  }
  //THIS LOGIC IS FOR CONTROLLING PERSISITENT BOTTOMNAVBAR ITEMS SIZE WHEN CLICKED

  TabController? controller;
  tabFuncation(TickerProvider vsync) {
    controller = TabController(length: 5, vsync: vsync);
    controller!.addListener(tabIndexChange);
  }

  tabIndexChange() {
    notifyListeners();
  }

  tabNavigate(BuildContext context, int index, {bool? isInitial}) {
    controller!.animateTo(index);
    if (isInitial == null) {
      notifyListeners();
    }
  }

  bool isSearchBar = false;
  searchBarToggle({bool? val}) {
    isSearchBar = val!;
    notifyListeners();
  }

  int arrivalTap = 0;
  onArrivalChange() {
    if (arrivalTap == 0) {
      arrivalTap = 1;
    } else if (arrivalTap == 1) {
      arrivalTap = 2;
    } else if (arrivalTap == 2) {
      arrivalTap = 0;
    }
    notifyListeners();
  }

  int departurelTap = 0;
  onDepartureChange() {
    if (departurelTap == 0) {
      departurelTap = 1;
    } else if (departurelTap == 1) {
      departurelTap = 2;
    } else if (departurelTap == 2) {
      departurelTap = 0;
    }
    notifyListeners();
  }

  int quickLaunchSelected = 0;
  onQuickLaunchChange(value) {
    quickLaunchSelected = value;
    notifyListeners();
  }

  int tabTap = 0;
  onTapChange(value) {
    tabTap = value;
    notifyListeners();
  }
}
