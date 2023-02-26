import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/home_controller.dart';

void showDialogUrl(HomeController controller) {
  TextEditingController urlController = TextEditingController();
  Get.defaultDialog(
      title: "Add Url",
      titleStyle: GoogleFonts.poppins(fontSize: 17.sp),
      content: TextField(
        decoration: InputDecoration(hintText: "add url"),
        controller: urlController,
      ),
      middleTextStyle: GoogleFonts.poppins(fontSize: 17.sp),
      actions: [
        ElevatedButton(
            onPressed: () {
              if (urlController.text.isNotEmpty) {
                controller.contentController.text = urlController.text;
              }
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                foregroundColor: Colors.white),
            child: Text(
              "add",
              style: GoogleFonts.poppins(fontSize: 15.sp),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                side: BorderSide(width: 1),
                foregroundColor: Colors.black),
            child: Text(
              "cancel",
              style: GoogleFonts.poppins(fontSize: 15.sp),
            ))
      ]);
}
