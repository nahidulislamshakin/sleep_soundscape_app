import 'package:flutter/material.dart';

class SoundMixerProvider with ChangeNotifier{

  int _selectedBottomBar = 1;
  int get selectedBottomBar => _selectedBottomBar;
  void onSelectBottomBar(index){
    _selectedBottomBar = index;
    notifyListeners();
  }


  bool _isPausePressed = false;
  bool get isPausePressed => _isPausePressed;
  void onPausePressed(){
    _isPausePressed = !_isPausePressed;
    notifyListeners();
  }

  void pauseOrPlayMusic(){}

}