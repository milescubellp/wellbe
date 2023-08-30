import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodSpaceProvider extends ChangeNotifier {
  //THIS LOGIC IS USED FOR CONTROLLING GREEN COLOR ON RECOMMENDATION PAGE  IN ThoughtTab
  int selectedIndex = -1;
  void onSelectedIndexChange(int val) {
    selectedIndex = val;
    notifyListeners();
  }

  //THIS LOGIC IS FOR CONTROLLING BREATH IN DIALOGBOX THROUGH THOUGHT TAB
  bool isThoughtPage = false;
  void thoughtPageChange(bool val) {
    isThoughtPage = val;
    notifyListeners();
  }

  TabController? controller;
  tabFuncation(TickerProvider vsync, int length) {
    controller = TabController(length: length, vsync: vsync);
    controller!.addListener(tabIndexChange);
  }

  tabIndexChange() {
    notifyListeners();
  }

  tabNavigate(BuildContext context, int index, {bool? isInitial}) {
    controller!.animateTo(index);
    debugPrint(index.toString());
    if (isInitial == null) {
      notifyListeners();
    }
  }

  bool isSearchBar = false;
  searchBarToggle({bool? val}) {
    isSearchBar = val!;
    notifyListeners();
  }

  int monthFeelingTap = 0;
  onMonthFeelingsChange(value) {
    monthFeelingTap = value;
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

  int houseTap = 0;
  onHouseChange() {
    if (houseTap == 0) {
      houseTap = 1;
    } else if (houseTap == 1) {
      houseTap = 2;
    } else if (houseTap == 2) {
      houseTap = 0;
    }
    notifyListeners();
  }

  int tabTap = 0;
  onTapChange(value) {
    tabTap = value;
    notifyListeners();
  }

  int selectedWeekPodcast = 0;

  onChangeWeekPodcast(index) {
    selectedWeekPodcast = index;
    notifyListeners();
  }

  //THIS LOGIC IS FOR THOUGHT TAB SCREEN  TAB BUTTONS
  int selectEmotionalExprience = 0;
  onEmotionalExperienceChange(index) {
    selectEmotionalExprience = index;
    notifyListeners();
  }

  //THISLOGIC IS FOR LIBRARIES TAB TAB BUTTONS
  int selectGenre = 0;
  onEmotionalGenreChange(index) {
    selectGenre = index;
    notifyListeners();
  }
}
