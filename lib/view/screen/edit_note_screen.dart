import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/model/note.dart';

class EditNoteScreen extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final int i = ModalRoute.of(context)!.settings.arguments as int;
    controller.titleController.text = controller.notes[i].title!;
    controller.contentController.text = controller.notes[i].details!;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.ios_share_rounded)),
          IconButton(
              onPressed: () {
                controller.updateNote(controller.notes[i].id!,
                    controller.notes[i].dateTimeCreated!);
              },
              icon: const Icon(Icons.done))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.h,
        color: AppColors.containerBackground,
        elevation: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  controller.pickImage();
                },
                icon: const Icon(Icons.add_photo_alternate_rounded)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.add_link_rounded)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.check_box_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.format_bold_rounded)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.format_italic_rounded))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.titleController,
              style: GoogleFonts.poppins(fontSize: 25.sp),
              decoration: InputDecoration.collapsed(
                  hintText: "Title",
                  hintStyle: GoogleFonts.poppins(fontSize: 25.sp)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Created :${controller.notes[i].dateTimeCreated}",
              style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.8)),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: controller.contentController,
              style: GoogleFonts.poppins(fontSize: 18.sp),
              decoration: InputDecoration.collapsed(
                  hintText: "Start Typing",
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 15.sp, color: AppColors.grey)),
            ),
            SizedBox(
              height: 15.h,
            ),
            controller.notes[i].image == null
                ? Container()
                : Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20).r,
                        child: Image.file(
                          File(controller.notes[i].image!),
                          width: double.infinity,
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                controller.deleteImage();
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.red,
                              ))),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
