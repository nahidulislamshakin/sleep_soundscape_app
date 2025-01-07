import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleepsoundscapeapp/view/parent_screens/parent_screens.dart';
import 'package:sleepsoundscapeapp/view/sound_selection_screen/sound_selection_screen.dart';
import 'package:sleepsoundscapeapp/view_model/parent_screen_provider.dart';
import 'package:sleepsoundscapeapp/view_model/sound_selection_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //set device orientation to portraitUp during app running for better user experience of the UI
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //ensuring screen size for screen util package to implement pixel perfect UI
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //UI size of figma design
  static const double deviceWidth = 375;
  static const double deviceHeight = 812;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SoundSelectionProvider>(
          create: (_)=> SoundSelectionProvider(),
        ),
        ChangeNotifierProvider<ParentScreensProvider>(
          create: (_)=> ParentScreensProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(deviceWidth, deviceHeight),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color(0xFF09001F),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                showSelectedLabels: true,// Dark background color
                type: BottomNavigationBarType.fixed,
               selectedLabelStyle: TextStyle(
                   fontSize: 11,
                   fontWeight: FontWeight.w500,
                   color: Colors.white,),
                unselectedLabelStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.grey, // Explicitly set grey for unselected labels
              ),
               // selectedItemColor: Colors.white,
                //unselectedItemColor: Colors.grey,
              ),
              //setting-up elevatedButtonTheme globally according to figma design
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                        EdgeInsets.only(top: 11.h, bottom: 11.h,left: 16.w, right: 16.w,),),
                    backgroundColor:  WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.black38;
                        }
                        return Colors.transparent;
                      },
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      Colors.white,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                      ),
                    ),
                    elevation: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return 4; // Lower elevation when pressed
                      }
                      return 6; // Default elevation
                    }),
                    textStyle: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.disabled)) {
                          return TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey);
                        } else if (states.contains(WidgetState.pressed) ||
                            states.contains(WidgetState.hovered)) {
                          return TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          );
                        }
                        return TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        );
                      },
                    ),
                  ),
                ),

              //  setting-up textTheme globally according to figma and use screen_util feature for responsiveness
                textTheme: TextTheme(
                  headlineLarge: TextStyle(
                      fontSize: 40.sp,
                      //height: 45.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  headlineMedium: TextStyle(
                      fontSize: 32.sp,
                      //height: 40.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  headlineSmall: TextStyle(
                      fontSize: 24.sp,
                      //height: 30.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  titleLarge: TextStyle(
                      fontSize: 20.sp,
                      //height: 30.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  bodyLarge: TextStyle(
                      fontSize: 15.sp,
                      //height: 22.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  bodyMedium: TextStyle(
                      fontSize: 13.sp,
                      //height: 18.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                  ),
                  bodySmall: TextStyle(
                      fontSize: 11.sp,
                      //height: 14.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  labelLarge: TextStyle(
                      fontSize: 10.sp,
                     // height: 11.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),

                ),
            ),
            debugShowCheckedModeBanner: false,
            home:  const ParentScreens(),
          );
        },
      ),
    );
  }
}
