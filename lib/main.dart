import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/routes/AppPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
   @override
 Widget build(BuildContext context) {
   return GetMaterialApp(
     title: 'Music Player App',
     debugShowCheckedModeBanner: false,
     initialRoute: AppPages.INITIAL,
     getPages: AppPages.routes,
      );
 }
}
