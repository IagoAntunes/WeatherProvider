import 'package:flutter/material.dart';

class MenuNavigationController extends ChangeNotifier {
  ValueNotifier index = ValueNotifier(0);

  void changeIndex(int newIndex) {
    index.value = newIndex;
    notifyListeners();
  }
}
