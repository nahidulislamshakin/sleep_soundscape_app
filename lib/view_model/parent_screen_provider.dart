
import 'package:flutter/material.dart';
import 'package:sleepsoundscapeapp/view/sound_selection_screen/sound_selection_screen.dart';

class ParentScreensProvider with ChangeNotifier{

  List<Widget> screens = [const SoundSelectionScreen()];
  int selectedIndex = 0;

  void setSelectedIndex(int selectedIndex){
    this.selectedIndex = 0;
    notifyListeners();
    print("Selected Index :$selectedIndex");
  }

}