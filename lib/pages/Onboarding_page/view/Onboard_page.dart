import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Onboard_controller.dart';
import '../widget/onboardingitem_widget.dart';


class OnBoarding extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.find<OnBoardingController>();
    List<OnboardingItem> onboardingItems = controller.onboardingItems;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingItems.length,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                },
                itemBuilder: (context, index) {
                  return OnboardingItemWidget(
                    item: controller.onboardingItems[index],
                    controller: controller,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



