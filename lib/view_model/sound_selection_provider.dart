import 'package:flutter/material.dart';

class SoundSelectionProvider with ChangeNotifier{

  bool _soundTabPressed = true;
  bool get soundTabPressed => _soundTabPressed;
  bool _savedTabPressed = false;
  bool get savedTabPressed => _savedTabPressed;

  void onSoundsTabBarButtonPressed(){
    _soundTabPressed = true;
    _savedTabPressed = false;
    notifyListeners();
  }

  void onSavedTabBarButtonPressed(){
    _soundTabPressed = false;
    _savedTabPressed = true;
    notifyListeners();
  }

  final List<Map<String,dynamic>> filterButtonList = [
    {
      "categoryName":"All",
      "pressed":true,
      "onPressed":(){}
    },
    {
      "categoryName":"Rain",
      "pressed":false,
      "onPressed":(){}
    },
    {
      "categoryName":"Water",
      "pressed":false,
      "onPressed":(){}
    },
    {
      "categoryName":"Wind",
      "pressed":false,
      "onPressed":(){}
    },
    {
      "categoryName":"Instrument",
      "pressed":false,
      "onPressed":(){}
    },
    {
      "categoryName":"Night",
      "pressed":false,
      "onPressed":(){}
    },
  ];

  void onFilterButtonPressed(int index){
    filterButtonList[index]["pressed"] = !filterButtonList[index]["pressed"];
    notifyListeners();
  }

  final List<Map<String,dynamic>> _gridButtonList = [
    {
      "categoryName":"",
      "iconPath":"assets/icons/typhoon.png",
      "label":"Typhoon",
      "isLocked":false,
      "onTap":(){
        //onGridButtonPressed(0);
      },
      "isPressed":false,
    },
    {
      "categoryName":"",
      "iconPath":"assets/icons/sleet.png",
      "label":"Sleet",
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "categoryName":"",
      "iconPath":"assets/icons/sunny.png",
      "label":"Heavenly Drift",
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "categoryName":"",
      "iconPath":"assets/icons/Snow.png",
      "label":"Snowy Winter",
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "categoryName":"",
      "iconPath":"assets/icons/cloudiness.png",
      "label":"Cloudiness",
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "categoryName":"",
      "iconPath":"assets/icons/desert_wind.png",
      "label":"Desert Wind",
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "categoryName":"",
      "iconPath":"assets/icons/Night.png",
      "label":"Starry Nights",
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "categoryName":"",
      "iconPath":"assets/icons/Tribal_Drums.png",
      "label":"Tribal Drums",
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
  ];
  List<Map<String,dynamic>> get gridButtonList => _gridButtonList;

  void onGridButtonPressed(int index){
    _gridButtonList[index]["isPressed"] = !_gridButtonList[index]["isPressed"];
    notifyListeners();
  }

}