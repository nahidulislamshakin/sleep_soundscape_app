import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sleepsoundscapeapp/view/sound_selection_screen/sound_selection_screen.dart';

import '../../icons/custom_icon_icons.dart';
import '../../utils/custom_slider/custom_slider.dart';
import '../../view_model/mix_sound_provider.dart';
import '../../view_model/sound_selection_provider.dart';

class MixControlScreen extends StatelessWidget {
  const MixControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final soundSelectionProvider = context.watch<SoundSelectionProvider>();
    final mixProvider = context.watch<SoundMixerProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF09001F),

      bottomNavigationBar: soundSelectionProvider.isSavePressed == false ?
      BottomNavigationBar(
        currentIndex: mixProvider.selectedBottomBar,
        onTap: (index){
          mixProvider.onSelectBottomBar(index);
          if(index == 0){
            soundSelectionProvider.onSaveMusicPressed(context);
          }
          if(index == 1){
            mixProvider.onPausePressed();
          }
          // parentScreenProvider.setSelectedIndex(index);
          if(index == 2){
            soundSelectionProvider.onAllMixerItemRemove();
            soundSelectionProvider.onAppearMusicControllerButtons();
            Navigator.pop(context, PageTransition(type: PageTransitionType.fade,
            child: const SoundSelectionScreen(),),);
          }
        },

        iconSize: 30,
        elevation: 20,
        enableFeedback: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/love2.png'),
            label: 'Save',
            // backgroundColor: Color(0xfff2f5fc),
          ),
          BottomNavigationBarItem(
            icon: mixProvider.isPausePressed ?
            Image.asset('assets/icons/play.png')
            :
            Image.asset('assets/icons/pause.png')
            ,
            label: 'Pause',
            // backgroundColor: Color(0xfff2f5fc),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/close.png'),
            label: 'Clear All',
            // backgroundColor: Color(0xfff2f5fc),
          ),


        ],
      ) : SizedBox(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/img.png',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 7.w, sigmaY: 7.h),
              child: Container(
                height: deviceHeight,
                width: deviceWidth,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.h,
              ),
              child: Container(
                width: deviceWidth,
                height: deviceHeight - 50.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF09001F),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h), // Top spacing
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
                      SizedBox(height: 30.h,),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Your ",
                              style: Theme.of(context).textTheme.titleMedium?.
                              copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: "Mix",
                              style:  Theme.of(context).textTheme.titleMedium?.
                            copyWith(color: Colors.deepPurple.shade400, fontWeight: FontWeight.w600),

                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.h,),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: soundSelectionProvider.wantToSaveMusic.length,
                        itemBuilder: (context, index){
                          final music = soundSelectionProvider.wantToSaveMusic[index];
                          return   Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: VolumeSlider(
                                    color: Color(0xFF5C19B7),
                                   // icon: Icons.keyboard_arrow_right_outlined,
                                    soundName: music["name"],),
                                ),
                                SizedBox(width: 5.w,),
                                GestureDetector(
                                  onTap:(){
                                    if(soundSelectionProvider.wantToSaveMusic.length == 1){
                                      soundSelectionProvider.onAllMixerItemRemove();
                                      soundSelectionProvider.onAppearMusicControllerButtons();
                                      Navigator.pop(context, PageTransition(type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 600),
                                        child: const SoundSelectionScreen(),),);
                                    }

                                    soundSelectionProvider.onMixerItemRemove(music["id"]);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF28046B),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset('assets/icons/close.png'),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
