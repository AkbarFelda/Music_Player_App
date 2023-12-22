import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/routes/AppPages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController ctrEmail = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;
  late final SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();

    ctrEmail = new TextEditingController();
    ctrPassword = new TextEditingController();
  }

  loginUser(String email, password) async {
    final baseUrl = 'https://reqres.in/api/login';
    isLoading.value = true;

    final response = await http.post(
      Uri.parse(baseUrl),
      body: {'email': ctrEmail.text, 'password': ctrPassword.text},
    );

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> getToken = jsonDecode(response.body);
        final token = getToken['token'];
        print('token = $token');
        Get.snackbar("Selamat", "Login sukses");
        prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', token.toString());
        Get.toNamed(Routes.HOME_PAGE);
        isSuccess.value = true;
      } else {
        // Menampilkan Snackbar
        Get.snackbar(
          "Maaf",
          "Gagal login. Mohon isi kembali Email dan Password",
          backgroundColor: Colors.red, // Warna latar belakang Snackbar
          colorText: Colors.white, // Warna teks Snackbar
        );

        // Menyembunyikan loading indicator
        isLoading.value = false;

        // Mengosongkan kolom email dan password
        ctrEmail.text = '';
        ctrPassword.text = '';
      }
    } catch (e) {
      print(e);

      // Menyembunyikan loading indicator
      isLoading.value = false;
    }
  }
}
