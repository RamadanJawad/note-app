import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/home_controller.dart';

void showDialogDelete(HomeController controller, int i) {
  Get.defaultDialog(
      title: "Delete note",
      titleStyle: GoogleFonts.poppins(fontSize: 17.sp),
      middleText: "Are you sure you want to delete the note?",
      middleTextStyle: GoogleFonts.poppins(fontSize: 17.sp),
      actions: [
        ElevatedButton(
            onPressed: () {
              controller.deleteNote(controller.notes[i].id!);
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                foregroundColor: Colors.white),
            child: Text(
              "Yes",
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
              "No",
              style: GoogleFonts.poppins(fontSize: 15.sp),
            ))
      ]);
}
