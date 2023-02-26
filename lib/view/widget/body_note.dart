import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constant/assets.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/core/function/dialog.dart';
import 'package:note_app/view/screen/edit_note_screen.dart';

class BodyNote extends StatelessWidget {
  BodyNote({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.isEmpty()
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Image.asset(
                        AssetsPath.note,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Oops! There are no notes \n that you have created.',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.poppins(fontSize: 20.sp, color: Colors.white),
                )
              ],
            )
          : AnimationLimiter(
              child: MasonryGridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: controller.notes.length,
                  itemBuilder: (context, i) {
                    return AnimationConfiguration.staggeredGrid(
                        position: i,
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                            onLongPress: () {
                              showDialogDelete(controller, i);
                            },
                            onTap: () {
                              Get.to(() => EditNoteScreen(),
                                  transition: Transition.fade, arguments: i);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.containerBackground,
                                borderRadius: BorderRadius.circular(10).r,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller.notes[i].image == null
                                      ? Container()
                                      : ClipRRect(
                                          borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20))
                                              .r,
                                          child: Image.file(
                                            File(controller.notes[i].image!),
                                            width: double.infinity,
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.notes[i].title!,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      controller.notes[i].details!,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.notes[i].dateTimeEdited!,
                                      style:
                                          GoogleFonts.poppins(fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                        ));
                  }),
            );
    });
  }
}
