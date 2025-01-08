import 'package:flutter/material.dart';

class VolumeSliderProvider with ChangeNotifier{

  double sliderValue = 50;

  void onChanges(double value){
    sliderValue = value;
    notifyListeners();
  }

}