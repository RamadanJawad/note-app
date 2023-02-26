import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/core/function/dailog_url.dart';
import 'package:note_app/view/widget/body_addNote.dart';
import 'package:share_plus/share_plus.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Share.share(
                      "${controller.titleController.text}\n${controller.contentController.text}");
                },
                icon: const Icon(
                  Icons.ios_share_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  controller.addNote();
                },
                color: Colors.white,
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
                  onPressed: () {
                    showDialogUrl(controller);
                  },
                  icon: const Icon(Icons.add_link_rounded)),
            ],
          ),
        ),
        body: const BodyAddNote());
  }
}
