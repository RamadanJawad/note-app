import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/view/widget/custom_button.dart';

void showBottomSheetTask(
    {required String title,
    required void Function() onTap,
    required TextEditingController controller}) {
  Get.bottomSheet(Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(10).r),
    height: 300.h,
    child: Column(
      children: [
        TextFormField(
          controller: controller,
          cursorColor: Colors.grey,
          maxLines: 5,
          maxLength: 30,
          style: GoogleFonts.cairo(fontSize: 18),
          decoration: InputDecoration(
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              hintText: "Type Something..",
              hintStyle: GoogleFonts.cairo(fontSize: 18),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white))),
        ),
        CustomButton(title: title, onPressed: onTap)
      ],
    ),
  ));
}
