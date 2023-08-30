import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ConsultProvider extends ChangeNotifier {
  //THIS LOGIC IS USED FOR HIDE AND SHOW LOGIC FOR Ottp on PaymentConfirmation SCREEN
  bool isVerfied = false;
  void onVerifiedChange({bool? val}) {
    if (val != null) {
      isVerfied = val;
    } else {
      isVerfied = !isVerfied;
    }
    notifyListeners();
  }

  //THIS LOGIC IS USED FOR HIDE AND SHOW LOGIC FOR UNDER 18 on PaymentConfirmation SCREEN
  bool showTextField = false;
  void handleRadioValueChanged(bool? value) {
    showTextField = value!;
    notifyListeners();
  }

  //THIS IS THE LOGIC FOR Appointment SCREEN TAB BUTTONS
  int sessionModeIndex = 0;
  onsessionModeIndexChange(index) {
    doctorsSelectTypeIndex = index;
    notifyListeners();
  }

  int? doctorId;
  onDoctorIdChanged(val) {
    doctorId = val;
    notifyListeners();
  }

  //THIS LOGIC IS FOR GOING BACK TO HOMESCREEN
  PersistentTabController? persistentController;

  void intializePersistentController(index) {
    persistentController = PersistentTabController(initialIndex: index ?? 0);
    persistentController!.jumpToTab(index ?? 0);

    // _persistentController!.jumpToTab(index)
    // persistentController!.addListener(tabIndexChange);
  }

  void changeIndex(index) {
    persistentController!.jumpToTab(index);
    notifyListeners();
  }

  int itemIndex = 0;
  void onSelected(index, {isInit}) {
    itemIndex = index;
    persistentController = PersistentTabController(initialIndex: index);
    debugPrint('$index index//////////////////////');
    // _persistentController!.jumpToTab(index);
    if (isInit == null) {
      notifyListeners();
    }
  }

  tabIndexChange() {
    notifyListeners();
  }

  //     persistentController = PersistentTabController(initialIndex: 1);
  // void goBackToHomeScreen(int index) {
  //   // intializePersistentController();
  //
  //   _persistentController!.jumpToTab(index ?? 0);
  //   debugPrint(_persistentController!.jumpToTab(0).toString());
  //   notifyListeners();
  // }

  //THIS IS THE LOGIC FOR DoctorsDetail SCREEN TAB BUTTONS
  int doctorsSelectTypeIndex = 0;
  onDoctorsSelectTypeChange(index) {
    doctorsSelectTypeIndex = index;
    notifyListeners();
  }

  //THIS IS THE LOGIC FOR DoctorsDetail SCREEN TO CONTROL AVAILABLE TIME SLOTS TAB BUTTONS
  int availableTimeSlotIndex = 0;
  onavailableTimeSlotChange(index) {
    availableTimeSlotIndex = index;
    notifyListeners();
  }

  //THIS IS THE LOGIC FOR DoctorsDetail SCREEN TO CONTROL SELECT SESSION DURATION TAB BUTTONS
  int selectSessionDurationIndex = 0;
  onselectSessionDurationChange(index) {
    selectSessionDurationIndex = index;
    notifyListeners();
  }

  String appointmentDate = "";
  String sessionMode = "";
  String timeSlot = "";
  String sessionDuration = "";
  String sessionPrice = "";

  void updateAppointmentData({
    String? date,
    String? mode,
    String? slot,
    String? duration,
    String? price,
  }) {
    appointmentDate = date!;
    sessionMode = mode!;
    timeSlot = slot!;
    sessionDuration = duration!;
    sessionPrice = price!;

    notifyListeners();
  }

//  THIS IS FOR Appointment Screen  TABBAR LOGIC

  TabController? controller;
  tabFuncation(TickerProvider vsync, [int length = 4]) {
    controller = TabController(length: length, vsync: vsync);
    controller!.addListener(tabIndexChange);
  }

  // tabIndexChange() {
  //   notifyListeners();
  // }
}
