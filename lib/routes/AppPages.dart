import 'package:get/get.dart';
import 'package:music_player/pages/Login_page/binding/Login_binding.dart';
import 'package:music_player/pages/Login_page/view/Login_page.dart';
import '../pages/Home_page/view/Home_page.dart';
import '../pages/Onboarding_page/binding/Onboard_binding.dart';
import '../pages/Onboarding_page/view/Onboard_page.dart';
import '../pages/Splash_page/view/splash_page.dart';
import '../pages/navigator_page/binding/navbar_binding.dart';
import '../pages/navigator_page/view/navbar.dart';
part 'AppRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
        name: _Paths.BOTTOM_NAVBAR,
        page: () => BottomNavBar(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.HOME_PAGE,
        page: () => HomePage(),
        binding: HomePageBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.ONBOARDING_PAGE,
        page: () => OnBoarding(),
        binding: OnBoardingBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1500)),
    GetPage(
        name: _Paths.SPLASH_PAGE,
        page: () => SplashPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1500)),
    GetPage(
        name: _Paths.LOGIN_PAGE,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
