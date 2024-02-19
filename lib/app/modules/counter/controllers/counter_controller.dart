import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 1.obs;

  void increment() {
    if (count.value < 20) {
      count.value++;
    } else {
      Get.snackbar(
        'Peringatan',
        'Nilai tidak dapat melebihi ${count.value}',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.notifications),
        backgroundColor: Colors.greenAccent,
      );
    }
  }

  void decrease() {
    if (count.value > 1) {
      count.value--;
    } else {
      Get.snackbar(
        'Peringatan',
        'Nilai tidak dapat kurang dari ${count.value}',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.notifications),
        backgroundColor: Colors.greenAccent,
      );
    }
  }
}
