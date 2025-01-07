import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepsoundscapeapp/view_model/parent_screen_provider.dart';

class ParentScreens extends StatelessWidget{
  const ParentScreens({super.key});

  @override
  Widget build(BuildContext context) {

    final parentScreenProvider = context.watch<ParentScreensProvider>();

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(

       currentIndex: 2,
       onTap: (index){
       // parentScreenProvider.setSelectedIndex(index);
       },

       iconSize: 30,
       elevation: 20,
       enableFeedback: true,
       items: [
         BottomNavigationBarItem(
           icon: Image.asset('assets/icons/home_off.png'),
           label: 'Home',
           // backgroundColor: Color(0xfff2f5fc),
         ),
         BottomNavigationBarItem(
           icon: Image.asset('assets/icons/music_off.png'),
           label: 'Library',
           // backgroundColor: Color(0xfff2f5fc),
         ),
         BottomNavigationBarItem(
           icon: Image.asset('assets/icons/mixer_on.png'),
           label: 'Create',
           // backgroundColor: Color(0xfff2f5fc),
         ),
         BottomNavigationBarItem(
           icon: Image.asset('assets/icons/alarm_off.png'),
           label: 'Alarm',
           // backgroundColor: Color(0xfff2f5fc),
         ),
         BottomNavigationBarItem(
           icon: Image.asset('assets/icons/award_off.png'),
           label: 'Awards',
           // backgroundColor: Color(0xfff2f5fc),
         ),
       ],
     ),

      body: IndexedStack(
        index: 0,
        children: parentScreenProvider.screens,
      ),
    );
  }
}