import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/launch_screen.dart';
import 'package:note_app/core/constant/color.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaunchController());
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Text(
              "Note App",
              style: GoogleFonts.cairo(fontSize: 25, color: Colors.white),
            ),
          ),
          const Spacer(),
          const CupertinoActivityIndicator(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
