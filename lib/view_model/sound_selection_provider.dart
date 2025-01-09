import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleepsoundscapeapp/utils/buttons/custom_elevated_button.dart';
import 'package:sleepsoundscapeapp/view/sound_selection_screen/sound_selection_screen.dart';

class SoundSelectionProvider with ChangeNotifier{

SoundSelectionProvider(){
  _isAppearMusicControllerButtons.addListener(onAppearMusicControllerButtons);
  _filteredGridButtonList = _gridButtonList;
}

bool _isSearchExpanded = false;
bool get isSearchExpanded => _isSearchExpanded;
TextEditingController searchController = TextEditingController();
FocusNode searchFocusNode = FocusNode();

double _searchBarWidth = 50;
double get searchBarWidth => _searchBarWidth;
void onSearchPressed(){
 _searchBarWidth = _isSearchExpanded ? 50 : 250;
 debugPrint('searchBarWidth: $_searchBarWidth');
  _isSearchExpanded = !_isSearchExpanded;
  notifyListeners();
}

void search(){
  if(searchController.text.isNotEmpty){
    _filteredGridButtonList = _gridButtonList.where((button)=>
      button["label"].toString().toLowerCase().contains(searchController.text.toLowerCase()),
    ).toList();
    notifyListeners();
  }
  else{
    _filteredGridButtonList = _gridButtonList;
    notifyListeners();
  }
}

  bool _soundTabPressed = true;
  bool get soundTabPressed => _soundTabPressed;
  bool _savedTabPressed = false;
  bool get savedTabPressed => _savedTabPressed;

  void onCloseIconPressed(){
    for(int i = 0; i< _filteredGridButtonList.length; i++){
      _filteredGridButtonList[i]["isPressed"] = false;
    }
    notifyListeners();
  }

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
  final List<Map<String,dynamic>> categoryButtonList = [
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
      "categoryName":"Winter",
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
    for(int i = 0; i< categoryButtonList.length; i++){
      if(i != index){
        categoryButtonList[i]["pressed"] = false;
      }
    }

    if( categoryButtonList[index]["pressed"] == true){
      categoryButtonList[index]["pressed"] = true;
     // categoryButtonList[index]["pressed"] = index != 0 ? false : true;
    }
    else{
      categoryButtonList[index]["pressed"] = !categoryButtonList[index]["pressed"];
    }

      if(index != 0 && categoryButtonList[index]["pressed"] == true){
      _filteredGridButtonList = _gridButtonList.where((button)=>
      button["categoryName"] == categoryButtonList[index]["categoryName"],
      ).toList();
      //notifyListeners();

    }
    else {
      _filteredGridButtonList = _gridButtonList;
    }
    notifyListeners();

  }

  //List of Grid button
  final List<Map<String,dynamic>> _gridButtonList = [
    {
      "id":1,
      "categoryName":"Wind",
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
      "categoryName":"Rain",
      "iconPath":"assets/icons/sleet.png",
      "label":"Sleet",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":3,
      "categoryName":"Wind",
      "iconPath":"assets/icons/sunny.png",
      "label":"Heavenly Drift",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":4,
      "categoryName":"Winter",
      "iconPath":"assets/icons/Snow.png",
      "label":"Snowy Winter",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":5,
      "categoryName":"Rain",
      "iconPath":"assets/icons/cloudiness.png",
      "label":"Cloudiness",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":6,
      "categoryName":"Wind",
      "iconPath":"assets/icons/desert_wind.png",
      "label":"Desert Wind",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":7,
      "categoryName":"Night",
      "iconPath":"assets/icons/Night.png",
      "label":"Starry Nights",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":8,
      "categoryName":"Instrument",
      "iconPath":"assets/icons/Tribal_Drums.png",
      "label":"Tribal Drums",
      "isSaved":false,
      "isLocked":false,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":9,
      "categoryName":"Rain",
      "iconPath":"assets/icons/light_rain.png",
      "label":"Light Rain",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":10,
      "categoryName":"Wind",
      "iconPath":"assets/icons/wind.png",
      "label":"Wind",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":11,
      "categoryName":"Rain",
      "iconPath":"assets/icons/thunder.png",
      "label":"Thunder",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":12,
      "categoryName":"Wind",
      "iconPath":"assets/icons/Tornado.png",
      "label":"Tornado",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":13,
      "categoryName":"Rain",
      "iconPath":"assets/icons/medium_rain.png",
      "label":"Medium Rain",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":14,
      "categoryName":"Wind",
      "iconPath":"assets/icons/snowy_breeze.png",
      "label":"Snowy Breeze",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":15,
      "categoryName":"Rain",
      "iconPath":"assets/icons/heavy_rain.png",
      "label":"Heavy Rain",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },
    {
      "id":16,
      "categoryName":"Wind",
      "iconPath":"assets/icons/wind_2.png",
      "label":"Wind",
      "isSaved":false,
      "isLocked":true,
      "onTap":(){},
      "isPressed":false,
    },

  ];
  List<Map<String,dynamic>> _filteredGridButtonList = [];
  List<Map<String,dynamic>> get filteredGridButtonList => _filteredGridButtonList;

  List<Map<String,dynamic>> savedMusicList = [];

  List<Map<String,dynamic>> get gridButtonList => _gridButtonList;

  List<Map<String,dynamic>> _wantToSaveMusic = [];
  List<Map<String,dynamic>> get wantToSaveMusic => _wantToSaveMusic;

bool _isAlreadySaved = false;
bool get isAlreadySaved => _isAlreadySaved;
  //on press grid button
  void onGridButtonPressed(int index){
    _gridButtonList[index]["isPressed"] = !_gridButtonList[index]["isPressed"];
    if(_gridButtonList[index]["isPressed"] == true){
      _wantToSaveMusic.add(
          {
            "id": _gridButtonList[index]["id"],
            "name":_gridButtonList[index]["label"],
            "categoryName": _gridButtonList[index]["categoryName"],
            "iconPath": _gridButtonList[index]["iconPath"],
            "volumeValue":50.0
          }

      );
    }
    else{
      _wantToSaveMusic.removeWhere((element)=>
      element["id"] == _gridButtonList[index]["id"] );
    }

    debugPrint("\nsaved music id : $savedMusicList\n\nwant to save : $_wantToSaveMusic");
    // debugPrint("\nCheck already save or not before matching : $_isAlreadySaved\n");
    // _isAlreadySaved = savedMusicList.any((music) {
    //   // Check if the "id" in the map matches _wantToSaveMusic in both elements and order
    //   return const ListEquality().equals(music["id"], _wantToSaveMusic);
    // });

    //debugPrint("\nCheck already save or not after matching : $_isAlreadySaved\n");

    notifyListeners();
  }

void updateSliderValue(int id, double newValue) {
  final index = _wantToSaveMusic.indexWhere((music) => music["id"] == id);
  if (index != -1) {
    _wantToSaveMusic[index]["volumeValue"] = newValue;
    notifyListeners();
  }
}

  void onMixerItemRemove(int id){
    _wantToSaveMusic.removeWhere((element)=>
    element["id"] == id );

    for(int i = 0; i<_gridButtonList.length; i++){
      if(_gridButtonList[i]["id"] == id){
        _gridButtonList[i]["isPressed"] = false;
        break;
      }
    }
    notifyListeners();
  }

  void onAllMixerItemRemove(){
    _wantToSaveMusic = [];
    for(int i = 0; i<_gridButtonList.length; i++){
        _gridButtonList[i]["isPressed"] = false;
    }
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

  bool _isSavePressed = false;
  bool get isSavePressed => _isSavePressed;
  TextEditingController _mixerNameController = TextEditingController();
  void onSaveMusicPressed(BuildContext context){

    final formKey = GlobalKey<FormState>();

    if (_wantToSaveMusic.isNotEmpty) {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent, // Match your dark background color
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          isScrollControlled: true, // Allows the modal to resize if the keyboard pops up
          builder: ( context) {
            // return
            //   DraggableScrollableSheet(
            //   expand: false,
            //     initialChildSize: 0.4, // Adjust the initial height
            //     maxChildSize: 0.8, // Maximum height
            //     minChildSize: 0.2, // Minimum height
            //   builder: (context,scrollController) {
                return Container(
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom, // Handle keyboard
                    left: 0,
                    right: 0,
                    top: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF160045),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                //    controller: scrollController,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.h,),
                          Center(
                            child: Container(
                              width: 40.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3), // Adjust color to match your design
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                          ),

                          SizedBox(height: 15.h,),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Save this ",
                                  style: Theme.of(context).textTheme.titleMedium?.
                                  copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: "mix",
                                  style:  Theme.of(context).textTheme.titleMedium?.
                                  copyWith(color: Colors.deepPurple.shade400, fontWeight: FontWeight.w600),

                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 20.h,),
                          Container(
                            height: 50,
                            width: double.infinity,
                            padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                            margin:  EdgeInsets.only(left: 10.w,right: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF160045),
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 1
                              )
                            ),
                            child: TextFormField(

                              controller: _mixerNameController,
                              style: Theme.of(context).textTheme.bodyMedium,
                              onTapOutside: (_){FocusScope.of(context).unfocus();},
                              validator: (value){
                                if(value.toString().isEmpty){
                                  return "Please write mix name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                               fillColor: const Color(0xFF160045),
                                filled: true,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                // const OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     color: Colors.deepPurple,
                                //     width: 1
                                //   )
                                // ),
                                  errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red.shade300),
                                border: InputBorder.none,
                                // OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(15)
                                // ),
                                labelText: "Write mix name",
                                labelStyle: Theme.of(context).textTheme.bodyMedium?.
                                  copyWith(color: Colors.grey, fontWeight: FontWeight.w500)
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                      color: Colors.transparent,
                                      // gradient:  LinearGradient(
                                      //   colors: pressed == true ? [const Color(0xFF42098F), const Color(0xFFB53FFE)] : [const Color(0xFF09001F),const Color(0xFF09001F),],
                                      //   begin: Alignment.topLeft,
                                      //   end: Alignment.bottomRight,
                                      // ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                      ),
                                        onPressed: (){Navigator.pop(context);},
                                        child: Text("Cancel",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                      //color: Colors.purple,
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF42098F),
                                          Color(0xFF793BC4)
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                      ),
                                      onPressed: (){
                                        if(formKey.currentState!.validate()){
                                          savedMusicList.add( {
                                            "playListName" : _mixerNameController.text,
                                            "musicList" : _wantToSaveMusic,
                                          });
                                          debugPrint("\nsuccessful\n$savedMusicList\n");

                                          Navigator.pop(context);
                                        }

                                      },
                                      child: Text("Save",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            //   }
            // );
          });



      // Add the selected music IDs to savedMusicList as a list
      // savedMusicList.add({
      //   "id": List<int>.from(_wantToSaveMusic), // Ensure a new list is added
      // });
      debugPrint("Saved successfully: $savedMusicList");
      notifyListeners();
    } else {
      debugPrint("No music selected to save.");
    }
  }






}