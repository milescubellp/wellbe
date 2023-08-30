import 'package:flutter/cupertino.dart';

class VentoutProvider extends ChangeNotifier {
  //THIS LOGIC IS USED FOR CHART SCREEN WHEN USER CLICK OK USER WILL BE TAKEN TO VentoutScreen
  //AND START CONVERSATION BUTTON BACKGROUN WILLBE CHANGED TO GREEN ALSO TEXT AND EXTRA DETAIL BUTTON SHOW.
  bool isBooked = false;
  void onisBookedChange(bool val) {
    isBooked = val;
    notifyListeners();
  }

  //THIS LOGIC ISUSED  WHEN A USER NAVIGATE TO APPOINTMENT SCREEN FROM Conecting Expert ONLY ONE
  //CHAT TAB WILL BE SHOWN
  bool isStartConversationScreen = false;
  void onisStartConversationScreenChange(bool val) {
    isStartConversationScreen = val;
    notifyListeners();
  }

  //THIS LOGIC IS USED FOR CONTROLLING SCREEN NAVIGATION THROUGH START CONVERSATION SCREEN
  bool isConversationScreen = false;
  void onisConversationScreenChange(bool val) {
    isConversationScreen = val;
    notifyListeners();
  }

  //THIS LOGIC IS USED FOR CONTROLLING DISABLED AND ENABLED COMMENT LOGIC IN HeadingPost Screen
  bool isDisabled = false;
  void onDisabledChange(bool val) {
    isDisabled = val;
    notifyListeners();
  }

//  THIS CODE IS USE FOR HANDLING NAVIGATION OF ConnectingExperts SCREEN
  bool? isShow = false;
  void onScreenChange(val) {
    isShow = true;
    notifyListeners();
  }
}
