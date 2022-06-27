import 'package:flutter/cupertino.dart';

enum RollSlotControllerState { random, stopped }

class RollSlotController extends ChangeNotifier {
  RollSlotControllerState _state = RollSlotControllerState.random;

  RollSlotControllerState get state => _state;

  int _currentIndex = 0;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;

  void dropRandomly() {
    _state = RollSlotControllerState.random;
    notifyListeners();
    _state = RollSlotControllerState.stopped;
  }
}