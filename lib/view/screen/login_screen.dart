import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/login_controller.dart';
import 'package:note_app/core/constant/color.dart';
import 'package:note_app/view/widget/custom_button.dart';
import 'package:note_app/view/widget/custom_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Login Screen",
          style: GoogleFonts.cairo(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            CustomField(
                controller: controller.emailController,
                hintText: "Enter your email",
                icon: Icon(Icons.email)),
            const SizedBox(
              height: 10,
            ),
            CustomField(
                controller: controller.passwordController,
                hintText: "Enter your password",
                icon: Icon(Icons.lock)),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: "Login",
                onPressed: () async {
                  await controller.performLogin();
                })
          ],
        ),
      ),
    );
  }
}
