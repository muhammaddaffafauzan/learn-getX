import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/button_navigation/controllers/button_navigation_controller.dart';
import 'package:learn_getx/app/modules/category/views/category_view.dart';
import 'package:learn_getx/app/modules/home/views/home_view.dart';
import 'package:learn_getx/app/modules/profile/views/profile_view.dart';
// import 'package:learn_getx/app/routes/app_pages.dart';

class ButtonNavigationView extends StatelessWidget {
  final ButtonNavigationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [HomeView(), CategoryView(), ProfileView()],
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.changePage(index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Profile")
        ],
      ),
    );
  }
}
