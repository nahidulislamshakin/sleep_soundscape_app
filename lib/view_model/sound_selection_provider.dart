import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SoundSelectionProvider with ChangeNotifier{

SoundSelectionProvider(){
  _isAppearMusicControllerButtons.addListener(onAppearMusicControllerButtons);
}

bool _isSearchExpanded = false;
bool get isSearchExpanded => _isSearchExpanded;
TextEditingController searchController = TextEditingController();
void onSearchPressed(){
  _isSearchExpanded = !_isSearchExpanded;
  notifyListeners();
}

  bool _soundTabPressed = true;
  bool get soundTabPressed => _soundTabPressed;
  bool _savedTabPressed = false;
  bool get savedTabPressed => _savedTabPressed;

  //sound tab button pressed method
  void onSoundsTabBarButtonPressed(){
    _soundTabPressed = true;
    _savedTabPressed = false;
    notifyListeners();
  }

  //saved tab button pressed method
  void onSavedTabBarButtonPressed(){
    _soundTabPressed = false;
    _savedTabPressed = true;
    notifyListeners();
  }

  //List of the filter button
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

  //onPress filterButton
  void onFilterButtonPressed(int index){
    filterButtonList[index]["pressed"] = !filterButtonList[index]["pressed"];
    notifyListeners();
  }

  //List of Grid button
  final List<Map<String,dynamic>> _gridButtonList = [
    {
      "id":1,
      "categoryName":"",
      "iconPath":"assets/icons/typhoon.png",
      "label":"Typhoon",
      "isSaved":false,
      "isLocked":false,
      "isPressed":false,
      "onTap":(){
        //onGridButtonPressed(0);
      },

    },
    {
      "id":2,
      "categoryName":"",
      "iconPath":"assets/icons/sleet.png",
      "label":"Sleet",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":3,
      "categoryName":"",
      "iconPath":"assets/icons/sunny.png",
      "label":"Heavenly Drift",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":4,
      "categoryName":"",
      "iconPath":"assets/icons/Snow.png",
      "label":"Snowy Winter",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":5,
      "categoryName":"",
      "iconPath":"assets/icons/cloudiness.png",
      "label":"Cloudiness",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":6,
      "categoryName":"",
      "iconPath":"assets/icons/desert_wind.png",
      "label":"Desert Wind",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":7,
      "categoryName":"",
      "iconPath":"assets/icons/Night.png",
      "label":"Starry Nights",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":8,
      "categoryName":"",
      "iconPath":"assets/icons/Tribal_Drums.png",
      "label":"Tribal Drums",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":9,
      "categoryName":"",
      "iconPath":"assets/icons/light_rain.png",
      "label":"Light Rain",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":10,
      "categoryName":"",
      "iconPath":"assets/icons/wind.png",
      "label":"Wind",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":11,
      "categoryName":"",
      "iconPath":"assets/icons/thunder.png",
      "label":"Thunder",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":12,
      "categoryName":"",
      "iconPath":"assets/icons/Tornado.png",
      "label":"Tornado",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":13,
      "categoryName":"",
      "iconPath":"assets/icons/medium_rain.png",
      "label":"Medium Rain",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":14,
      "categoryName":"",
      "iconPath":"assets/icons/snowy_breeze.png",
      "label":"Snowy Breeze",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":15,
      "categoryName":"",
      "iconPath":"assets/icons/heavy_rain.png",
      "label":"Heavy Rain",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":16,
      "categoryName":"",
      "iconPath":"assets/icons/wind_2.png",
      "label":"Wind",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },

  ];

  List<Map<String,dynamic>> savedMusicList = [];

  List<Map<String,dynamic>> get gridButtonList => _gridButtonList;

  List<int> _wantToSaveMusic = [];

bool _isAlreadySaved = false;
bool get isAlreadySaved => _isAlreadySaved;
  //on press grid button
  void onGridButtonPressed(int index){
    _gridButtonList[index]["isPressed"] = !_gridButtonList[index]["isPressed"];
    if(_gridButtonList[index]["isPressed"] == true){
      _wantToSaveMusic.add(_gridButtonList[index]["id"]);
    }
    else{
      _wantToSaveMusic.remove(_gridButtonList[index]["id"]);
    }

    debugPrint("\nsaved music id : $savedMusicList\n\nwant to save : $_wantToSaveMusic");
    debugPrint("\nCheck already save or not before matching : $_isAlreadySaved\n");
    _isAlreadySaved = savedMusicList.any((music) {
      // Check if the "id" in the map matches _wantToSaveMusic in both elements and order
      return const ListEquality().equals(music["id"], _wantToSaveMusic);
    });

    debugPrint("\nCheck already save or not after matching : $_isAlreadySaved\n");

    notifyListeners();
  }

  bool isAnyButtonActive() {

    // for(int i = 0; i< _gridButtonList.length; i++){
    //   debugPrint("\n\n${_gridButtonList[i]["isPressed"]}\n\n");
    // }
    return _gridButtonList.any((button) => button["isPressed"] == true);
  }

  ValueNotifier<bool> _isAppearMusicControllerButtons = ValueNotifier<bool>(false);
  ValueNotifier<bool>  get isAppearMusicControllerButtons => _isAppearMusicControllerButtons;
  void onAppearMusicControllerButtons(){

    if(isAnyButtonActive()){
      _isAppearMusicControllerButtons = ValueNotifier<bool>(true);
      _isMusicPlay = true;
      notifyListeners();
    }
    else{
        _isAppearMusicControllerButtons = ValueNotifier<bool>(false);
        _isMusicPlay = false;
        notifyListeners();
        }
  }

  bool _isMusicPlay = false;
  bool get isMusicPlay => _isMusicPlay;
  void playOrPauseMusicPressed(){
    _isMusicPlay = !_isMusicPlay;
    notifyListeners();
  }

 // bool _isSavedMusic = false;
 // bool get isSavedMusic => _isSavedMusic;
  void onSaveMusicPressed(){
    if (_wantToSaveMusic.isNotEmpty) {
      // Add the selected music IDs to savedMusicList as a list
      savedMusicList.add({
        "id": List<int>.from(_wantToSaveMusic), // Ensure a new list is added
      });
      debugPrint("Saved successfully: $savedMusicList");
      _isAlreadySaved = true;
      notifyListeners();
    } else {
      debugPrint("No music selected to save.");
    }
  }






}