import 'package:get/get.dart';
import 'package:music_player/pages/Login_page/controller/Login_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}