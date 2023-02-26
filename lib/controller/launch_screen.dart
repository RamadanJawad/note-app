import 'package:get/get.dart';
import 'package:note_app/core/function/save_data.dart';
import 'package:note_app/view/screen/home_screen.dart';
import 'package:note_app/view/screen/login_screen.dart';

class LaunchController extends GetxController {
  check() {
    Future.delayed(Duration(seconds: 3), () {
      if (AppPreferences().loggedIn) {
        Get.to(() => HomeView());
      } else {
        Get.to(() => LoginScreen());
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    check();
  }
}
