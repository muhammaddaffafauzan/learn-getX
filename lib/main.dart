import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/controllers/category_controller.dart';
import 'package:learn_getx/app/modules/home/controllers/home_controller.dart';
import 'package:learn_getx/app/modules/profile/controllers/profile_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
  Get.put(HomeController());
  Get.put(CategoryController());
  Get.put(ProfileController());
}

