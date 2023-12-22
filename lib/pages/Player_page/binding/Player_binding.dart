import 'package:get/get.dart';
import 'package:music_player/pages/Player_page/controller/Player_controller.dart';


class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerController>(() => PlayerController());
  }
}