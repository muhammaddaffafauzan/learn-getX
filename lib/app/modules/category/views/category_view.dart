import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/views/category_add.dart';
import 'package:learn_getx/app/modules/category/views/category_show.dart';
import '../controllers/category_controller.dart';
import 'category_edit.dart';

class CategoryView extends GetView<CategoryController> {
  CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(() => CategoryAddView());
            },
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.categoryList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.categoryList.length,
              itemBuilder: (context, index) {
                var category = controller.categoryList[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(category.category),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(() => CategoryEditView(category: category));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () async {
                            // Tampilkan dialog konfirmasi sebelum delete
                            await Get.defaultDialog(
                              title: 'Konfirmasi',
                              middleText:
                                  'Apakah anda yakin ingin menghapus kategori "${category.category}"?',
                              textConfirm: 'Ya, hapus',
                              textCancel: 'Batal',
                              confirmTextColor: Colors.white,
                              onConfirm: () async {
                                await controller.deleteCategory(category.id);
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            Get.to(() => CategoryShowView(category: category));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
