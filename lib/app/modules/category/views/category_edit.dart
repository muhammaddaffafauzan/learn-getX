import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import 'package:learn_getx/app/data/categroy_model.dart';

class CategoryEditView extends StatelessWidget {
  final Category category;
  final CategoryController controller = Get.find();
  final TextEditingController categoryController = TextEditingController();

  CategoryEditView({Key? key, required this.category}) {
    categoryController.text = category.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  controller.editCategory(categoryController.text, category.id);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (categoryController.text.isEmpty) {
      Get.snackbar('Error', 'Category field must be filled');
      return false;
    }
    return true;
  }
}
