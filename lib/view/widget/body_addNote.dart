import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constant/color.dart';

class BodyAddNote extends StatelessWidget {
  const BodyAddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.titleController,
              style: controller.style,
              decoration: InputDecoration.collapsed(
                  hintText: "Title",
                  hintStyle: GoogleFonts.poppins(fontSize: 28.sp)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  "${DateFormat("MMM dd").format(DateTime.now())} ",
                  style:
                      GoogleFonts.poppins(color: Colors.white.withOpacity(0.8)),
                ),
                Text(
                  "${DateFormat.jm().format(DateTime.now())}",
                  style:
                      GoogleFonts.poppins(color: Colors.white.withOpacity(0.8)),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: controller.contentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: GoogleFonts.poppins(fontSize: 18.sp),
              decoration: InputDecoration.collapsed(
                  hintText: "Start Typing",
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 15.sp, color: AppColors.grey)),
            ),
            SizedBox(
              height: 15.h,
            ),
            controller.path == null
                ? Container()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20).r,
                    child: Image.file(
                      controller.path!,
                      width: double.infinity,
                    ),
                  )
          ],
        ),
      );
    });
  }
}
