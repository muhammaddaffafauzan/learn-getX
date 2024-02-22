import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/profile');
              },
              icon: Icon(Icons.person),
              label: Text(
                'to profile page',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                // Sesuaikan properti style sesuai kebutuhan
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/counter');
              },
              icon: Icon(Icons.countertops),
              label: Text(
                'to counter page',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                // Sesuaikan properti style sesuai kebutuhan
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/formulir');
              },
              icon: Icon(Icons.list),
              label: Text(
                'to formulir page',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                // Sesuaikan properti style sesuai kebutuhan
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/payment');
              },
              icon: Icon(Icons.payment),
              label: Text(
                'to formulir payment',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                // Sesuaikan properti style sesuai kebutuhan
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/category');
              },
              icon: Icon(Icons.category),
              label: Text(
                'to category page',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                // Sesuaikan properti style sesuai kebutuhan
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.logout();
                Navigator.of(context).pop();
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
