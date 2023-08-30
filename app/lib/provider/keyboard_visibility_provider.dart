import 'package:flutter/material.dart';

class KeyboardVisibilityProvider with ChangeNotifier {
  bool _isKeyboardVisible = false;

  bool get isKeyboardVisible => _isKeyboardVisible;

  void setKeyboardVisibility(bool isVisible) {
    _isKeyboardVisible = isVisible;
    debugPrint('Keyboard visibilty:' + _isKeyboardVisible.toString());
    notifyListeners();
  }
}
