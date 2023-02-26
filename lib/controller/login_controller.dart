import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/database/api/api_operation.dart';
import 'package:note_app/core/function/save_data.dart';
import 'package:note_app/model/user.dart';
import 'package:note_app/view/screen/home_screen.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }

    Get.snackbar("Error validation", "Enter Your Email & Password");
    return false;
  }

  Future login() async {
    User? user = await ApiController()
        .login(email: emailController.text, password: passwordController.text);
    if (user != null) {
      await AppPreferences().save(user);
      Get.to(() => HomeView());
    } else {
      Get.snackbar("Error", "login failed , please try again");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
