import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/view/screen/add_note_screen.dart';
import 'package:note_app/view/widget/body_note.dart';

class AllView extends StatelessWidget {
  const AllView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Get.to(() => AddNote(), transition: Transition.fade);
            controller.titleController.text = "";
            controller.contentController.text = "";
          },
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        body: BodyNote());
  }
}
