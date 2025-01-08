import 'dart:ui';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleepsoundscapeapp/utils/buttons/custom_elevated_button.dart';
import 'package:sleepsoundscapeapp/view_model/sound_selection_provider.dart';

import '../mix_controll_screen/mix_controll_screen.dart';

class SoundSelectionScreen extends StatelessWidget {
  const SoundSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final soundSelectionProvider = context.watch<SoundSelectionProvider>();

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      // extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/img.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Stack(
              //alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Row(
                        mainAxisAlignment:
                            soundSelectionProvider.isSearchExpanded == false
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          soundSelectionProvider.isSearchExpanded == false
                              ? Stack(
                                  children: [
                                    // Background blur effect
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          30.r), // Match button shape
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 20.w, sigmaY: 20.h),
                                        child: Container(
                                          height: 32.h,
                                          width: 109.w,
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

                                    SizedBox(
                                      width: 109.w,
                                      height: 32.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/icons/security_lock.png',
                                            fit: BoxFit.cover,
                                            width: 15,
                                            height: 15,
                                          ),
                                          Text(
                                            "Upgrade",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                                width: soundSelectionProvider.searchBarWidth.w,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      15.r), // Match button shape
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 50.w, sigmaY: 50.h),
                                    child: Container(
                                      height: 42.h,
                                      width: soundSelectionProvider
                                          .searchBarWidth.w,
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
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                                width: soundSelectionProvider.searchBarWidth.w,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (soundSelectionProvider
                                                  .isSearchExpanded ==
                                              false) {
                                            soundSelectionProvider
                                                .searchFocusNode
                                                .requestFocus();
                                          }
                                          soundSelectionProvider
                                              .onSearchPressed();
                                        },
                                        icon: const Image(
                                          image: AssetImage(
                                            'assets/icons/search.png',
                                          ),
                                          //  fit: BoxFit.cover,
                                        ),
                                      ),
                                      if (soundSelectionProvider
                                          .isSearchExpanded)
                                        Expanded(
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              soundSelectionProvider
                                                  .onSearchPressed();
                                            },
                                            focusNode: soundSelectionProvider
                                                .searchFocusNode,
                                            onTapOutside: (_) {
                                              FocusScope.of(context).unfocus();
                                            },
                                            controller: soundSelectionProvider
                                                .searchController,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                            onChanged: (value) {
                                              soundSelectionProvider.search();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Search",
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: Colors.grey),
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              pressed: soundSelectionProvider.soundTabPressed,
                              button: ElevatedButton(
                                onPressed: () {
                                  soundSelectionProvider
                                      .onSoundsTabBarButtonPressed();
                                },
                                child: Text(
                                  "Sounds",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ).customElevatedButton(context),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              pressed: soundSelectionProvider.savedTabPressed,
                              button: ElevatedButton(
                                onPressed: () {
                                  soundSelectionProvider
                                      .onSavedTabBarButtonPressed();
                                },
                                child: Text(
                                  "Saved",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ).customElevatedButton(context),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFF09001F),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ...soundSelectionProvider.categoryButtonList
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      int index = entry
                                          .key; // Get the index of the current element
                                      var button =
                                          entry.value; // Get the button object
                                      int i = -1;
                                      //  i++;
                                      //  debugPrint("\ni : $i\n");
                                      return Row(
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          CustomElevatedButton(
                                            button: ElevatedButton(
                                              onPressed: () {
                                                soundSelectionProvider
                                                    .onFilterButtonPressed(
                                                        index);
                                              },
                                              child: Text(
                                                button["categoryName"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                            pressed: button["pressed"],
                                          ).customElevatedButton(context),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 5.w,
                                    mainAxisSpacing: 15.h,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: soundSelectionProvider
                                      .filteredGridButtonList.length,
                                  itemBuilder: (context, index) {
                                    final gridButton = soundSelectionProvider
                                        .filteredGridButtonList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        // debugPrint("\nindex : $index\n");
                                        soundSelectionProvider
                                            .onGridButtonPressed(index);
                                        gridButton["onTap"];
                                        soundSelectionProvider
                                            .onAppearMusicControllerButtons();
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 72.w,
                                            height: 72.h,
                                            decoration: BoxDecoration(
                                              gradient: gridButton[
                                                          "isPressed"] ==
                                                      true
                                                  ? const LinearGradient(
                                                      colors: [
                                                        Color(0xFF28046B),
                                                        Color(0xFF793BC4)
                                                      ],
                                                      begin:
                                                          Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                    )
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                width: 1,
                                              ),
                                              //image: DecorationImage(image: AssetImage(gridButton["iconPath"],),)
                                            ),
                                            child: Image.asset(
                                              gridButton["iconPath"],
                                              color: gridButton["isPressed"] ==
                                                      true
                                                  ? Colors.white
                                                  : Colors.grey
                                                      .withOpacity(0.5),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            gridButton["label"],
                                            style:
                                                gridButton["isPressed"] == true
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .labelLarge
                                                        ?.copyWith(
                                                            color: Colors.white)
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                if (soundSelectionProvider
                        .isAppearMusicControllerButtons.value ==
                    true)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      height: 75.h,
                      width: 230.w,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20.r), // Match button shape
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 2.w, sigmaY: 2.h),
                                child: Container(
                                  height: 75.h,
                                  width: 230.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                        0.1), // Semi-transparent white
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            //  alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    soundSelectionProvider
                                        .playOrPauseMusicPressed();
                                  },
                                  child: Container(
                                      width: 45.w,
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF42098F),
                                            Color(0xFF793BC4)
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child:
                                          soundSelectionProvider.isMusicPlay ==
                                                  true
                                              ? Image.asset(
                                                  'assets/icons/pause.png',
                                                )
                                              : Image.asset(
                                                  'assets/icons/play.png',
                                                )),
                                ),
                                //SizedBox(width: 5.w,),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(context, PageTransition(
                                        child:  const MixControlScreen(),duration: const Duration(milliseconds: 300),
                                        type: PageTransitionType.bottomToTop),
                                    );
                                  },
                                  icon: Image.asset('assets/icons/mixer.png'),
                                ),
                                // SizedBox(width: 5.w,),
                                if (soundSelectionProvider.isAlreadySaved ==
                                    false)
                                  IconButton(
                                    onPressed: () {
                                      soundSelectionProvider
                                          .onSaveMusicPressed(context);
                                    },
                                    icon: Image.asset(
                                      'assets/icons/love2.png',
                                    ),
                                  ),
                                //SizedBox(width: 5.w,),
                                IconButton(
                                  onPressed: () {
                                    soundSelectionProvider.onCloseIconPressed();
                                    soundSelectionProvider
                                        .onAppearMusicControllerButtons();
                                  },
                                  icon: Image.asset('assets/icons/close.png'),
                                ),
                                // SizedBox(width: 5.w,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
