import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/utils/images.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Offline Melody Magic',
      subtitle: 'Experience the beauty of music at every step, free from the constraints of an internet connection. anywhere. Let music accompany you, even without a signal.',
      image: Images.onBoard1,
    ),
    OnboardingItem(
      title: 'Harmonize with Companions',
      subtitle: 'Amplify joy with pals! Share musical highs with our sharing tool. Initiate joint listening sessions, embracing camaraderie in each note. Spread joy through shared musical moments.',
      image: Images.onBoard2,
    ),
    OnboardingItem(
      title: 'Ad-Free Serenity',
      subtitle: 'Relish an uninterrupted music journey, free from intrusive ads. An immaculate and soothing listening experience, infusing significance into every moment.',
      image: Images.onBoard3,
    ),

  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardingItem {
  final String title;
  final String subtitle;
  final String image;

  OnboardingItem({required this.title, required this.subtitle, required this.image});
}
