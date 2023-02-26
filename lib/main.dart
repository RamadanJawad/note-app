import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/core/function/save_data.dart';
import 'package:note_app/view/screen/launch_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.scaffoldBackground,
    ));
    return ScreenUtilInit(
        designSize: const Size(392.7, 856.7),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                    actionsIconTheme:
                        IconThemeData(color: AppColors.lightTextColor),
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: AppColors.buttonColor),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.lightTextColor)),
                tabBarTheme: const TabBarTheme(
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3, color: AppColors.orange)),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: AppColors.orange),
                primaryColor: AppColors.containerBackground,
                fontFamily: GoogleFonts.poppins().fontFamily,
                scaffoldBackgroundColor: AppColors.scaffoldBackground,
                brightness: Brightness.dark,
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 50),
                        backgroundColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))))),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LaunchScreen(),
          );
        });
  }
}
