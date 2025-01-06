import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleepsoundscapeapp/utils/buttons/custom_elevated_button.dart';
import 'package:sleepsoundscapeapp/view_model/sound_selection_provider.dart';

class SoundSelectionScreen extends StatelessWidget {
  const SoundSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final soundSelectionProvider = context.watch<SoundSelectionProvider>();

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/img.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          // Background blur effect
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                30.r), // Match button shape
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 20.w, sigmaY: 20.h),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icons/security_lock.png',
                                  fit: BoxFit.cover,
                                  width: 15,
                                  height: 15,
                                ),
                                Text(
                                  "Upgrade",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(15.r), // Match button shape
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 20.w, sigmaY: 20.h),
                            child: Container(
                              height: 42.h,
                              width: 42.w,
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
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage(
                              'assets/icons/search.png',
                            ),
                            //  fit: BoxFit.cover,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      pressed: soundSelectionProvider.soundTabPressed,
                      button: ElevatedButton(
                        onPressed: () {
                          soundSelectionProvider.onSoundsTabBarButtonPressed();
                        },
                        child: Text(
                          "Sounds",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ).customElevatedButton(context),
                  ),
                  SizedBox(width: 5.w,),
                  Expanded(
                    child: CustomElevatedButton(
                      pressed: soundSelectionProvider.savedTabPressed,
                      button: ElevatedButton(
                        onPressed: () {
                          soundSelectionProvider.onSavedTabBarButtonPressed();
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

              Expanded(
                child: Container(
                  width: double.infinity,
                    height: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFF09001F)),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...soundSelectionProvider.filterButtonList.asMap().entries.map((entry){
                              int index = entry.key; // Get the index of the current element
                              var button = entry.value; // Get the button object
                              int i = -1;
                              i++;
                              debugPrint("\ni : $i\n");
                              return Row(
                                children: [
                                  SizedBox(width: 10.w,),
                                  CustomElevatedButton(
                                      button: ElevatedButton(
                                      onPressed: (){soundSelectionProvider.onFilterButtonPressed(index);},
                                        child: Text(button["categoryName"],style: Theme.of(context).textTheme.bodyMedium,),
                                      ),
                                      pressed: button["pressed"]).customElevatedButton(context),
                                ],
                              );
                            }).toList(),

                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 5.w,
                              mainAxisSpacing: 7.h,
                            ),
                            itemCount: soundSelectionProvider.gridButtonList.length,
                            itemBuilder: (context,index){
                              final gridButton = soundSelectionProvider.gridButtonList[index];
                              return GestureDetector(
                                onTap:(){
                                  soundSelectionProvider.onGridButtonPressed(index);
                                  gridButton["onTap"];
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 72.w,
                                      height: 72.h,
                                      decoration: BoxDecoration(
                                        gradient: gridButton["isPressed"] == true ?  const LinearGradient(
                                          colors:  [Color(0xFF42098F),Color(0xFFB53FFE)],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )
                                        :
                                        null,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.3),
                                          width: 1,
                                        ),
                                        //image: DecorationImage(image: AssetImage(gridButton["iconPath"],),)
                                      ),
                                      child: Image.asset(gridButton["iconPath"],
                                      color: gridButton["isPressed"] == true ? Colors.white : Colors.grey.withOpacity(0.5),),
                                      ),
                                    SizedBox(height: 3.h,),
                                    Text(gridButton["label"],style: Theme.of(context).textTheme.labelLarge,)
                                  ],
                                ),
                              );
                            },
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
