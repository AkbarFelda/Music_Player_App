import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/pages/Login_page/controller/Login_controller.dart';
import 'package:music_player/utils/color_resources.dart';
import 'package:music_player/utils/custom_themes.dart';
import '../../../utils/images.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  Widget myText(
      String label, bool isObsecure, TextEditingController myController) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: myController,
        obscureText: isObsecure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(
          () => loginController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Card(
                      color: Colors.white
                          .withOpacity(0.8), // Transparansi ditambahkan di sini
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              Images.splashLogo,
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Harmony',
                              style: loginHeaderTextStyle,
                            ),
                            SizedBox(height: 20),
                            myText("Email", false, loginController.ctrEmail),
                            SizedBox(height: 10),
                            myText(
                                "Password", true, loginController.ctrPassword),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                loginController.loginUser(
                                  loginController.ctrEmail.text,
                                  loginController.ctrPassword.text,
                                );
                                print(loginController.isLoading.value);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 110),
                                backgroundColor: ColorResources.primaryColor,
                              ),
                              child: Text(
                                'Login',
                                style: buttonTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
