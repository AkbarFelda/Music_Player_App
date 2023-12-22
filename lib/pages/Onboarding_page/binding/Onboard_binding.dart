import 'package:get/get.dart';
import 'package:music_player/pages/Onboarding_page/controller/Onboard_controller.dart';


class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}