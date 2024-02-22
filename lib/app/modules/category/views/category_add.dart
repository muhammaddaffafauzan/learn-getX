import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';

class CategoryAddView extends GetView<CategoryController> {
   CategoryAddView({Key? key}) : super(key: key);

  final TextEditingController categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Kategori:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              controller: categoryNameController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama kategori',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Tambahkan logika untuk menambah kategori baru di sini
                // Contoh: controller.addCategory();
                String categoryName = categoryNameController.text;
                if (categoryName.isNotEmpty) {
                  await controller.createCategory(categoryName);
                } else {
                  // Tampilkan pesan atau notifikasi jika nama kategori kosong
                  Get.snackbar('Error', 'Nama kategori tidak boleh kosong',
                      snackPosition: SnackPosition.TOP);
                }
              },
              child: Text('Tambah Kategori'),
            ),
          ],
        ),
      ),
    );
  }
}
