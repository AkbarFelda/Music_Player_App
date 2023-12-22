// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/images.dart';
import '../controller/splash_controller.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key); // Corrected constructor

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.white,
      body: Center(
        child: Image.asset(
          Images.splashLogo,
          width: 192.0,
        ),
      ),
    );
  }
}
