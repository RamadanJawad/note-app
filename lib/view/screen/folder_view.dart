import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constant/assets.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/core/database/api/api_operation.dart';
import 'package:note_app/core/function/bottom_sheet.dart';
import 'package:note_app/core/function/delete_task.dart';
import 'package:note_app/model/task.dart';

class FolderView extends StatelessWidget {
  const FolderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomSheetTask(
                title: "save",
                onTap: () {
                  controller.addTask();
                },
                controller: controller.taskController);
          },
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return FutureBuilder<List<Task>>(
                future: ApiController().readTask(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return AnimationLimiter(
                      child: MasonryGridView.count(
                          padding: const EdgeInsets.all(10),
                          crossAxisCount: 1,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, i) {
                            return AnimationConfiguration.staggeredGrid(
                                position: i,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                      child: GestureDetector(
                                    onLongPress: () {
                                      deleteTask(
                                          controller, snapshot.data![i].id!);
                                    },
                                    onTap: () {
                                      controller.editController.text =
                                          snapshot.data![i].title!;
                                      showBottomSheetTask(
                                          title: "edit",
                                          onTap: () {
                                            controller.updateTask(
                                                snapshot.data![i].id!);
                                          },
                                          controller:
                                              controller.editController);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.containerBackground,
                                        borderRadius:
                                            BorderRadius.circular(10).r,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data![i].title!,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                      ),
                                    ),
                                  )),
                                ));
                          }),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                              height: 100.h,
                              width: 100.w,
                              child: Image.asset(
                                AssetsPath.task,
                                color: Colors.grey,
                              )),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Oops! There are no tasks \n that you have created.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp, color: Colors.white),
                        ),
                      ],
                    );
                  }
                });
          },
        ));
  }
}
