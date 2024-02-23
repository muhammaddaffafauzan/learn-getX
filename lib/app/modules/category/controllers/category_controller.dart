// category_controller.dart
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_getx/app/modules/category/views/category_show.dart';
import 'package:learn_getx/app/routes/app_pages.dart';
import '../../../providers/api.dart';
import 'package:learn_getx/app/data/categroy_model.dart';

class CategoryController extends GetxController {
  var categoryList = <Category>[].obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  // Fetch data
  Future<void> fetchCategory() async {
    try {
      var apiUrl = '${Api.baseUrl}/event-categories';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        categoryList
            .assignAll(jsonResponse.map((model) => Category.fromJson(model)));
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      print('Error while fetching categories: $e');
    }
  }

  void showCategoryDetails(Category category) {
    Get.to(() => CategoryShowView(category: category));
  }

  // Create category
  Future<void> createCategory(String category) async {
    try {
      var apiUrl = '${Api.baseUrl}/event-categories/create';
      var headers = await Api.getHeaders();
      headers['Content-Type'] = 'application/json';

      var payload = json.encode({
        'category': category,
      });

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: payload,
      );

      if (response.statusCode == 201) {
        // Jika sukses, kita fetch ulang kategori setelah menambahkan kategori baru
        await fetchCategory();
        // Pindahkan pengguna ke halaman "/category"
        Get.offNamed('/category');
      } else {
        throw Exception('Failed to create category');
      }
    } catch (e) {
      print('Error while creating category: $e');
    }
  }

  // Edit category
  Future<void> editCategory(String updatedCategoryName, int categoryId) async {
    try {
      if (updatedCategoryName.isEmpty) {
        Get.snackbar('Error', 'Category field must be filled');
        return;
      }

      var apiUrl = '${Api.baseUrl}/event-categories/update/$categoryId';
      var headers = await Api.getHeaders();

      var payload = json.encode({
        'category': updatedCategoryName,
      });

      print('$categoryId  - $payload');

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: payload,
      );

if (response.statusCode == 200) {
  var responseBody = json.decode(response.body);

  if (responseBody['msg'] == 'Event category updated successfully') {
    Get.snackbar('Success', 'Category successfully edited');
    fetchCategory(); // Refresh the categoryList
    Get.offAndToNamed(Routes.CATEGORY); // Adjust the route accordingly
  } else {
    print('Failed to edit category. Server response: ${response.body}');
    // Display an appropriate error message to the user.
    Get.snackbar('Error', 'Failed to edit category. Unexpected server response');
  }
} else {
  // Handle different HTTP status codes or server response here
  print('Failed to edit category. Server response: ${response.body}');
  // You might want to display an appropriate error message to the user.
  Get.snackbar('Error', 'Failed to edit category. Server response: ${response.body}');
}

    } catch (e) {
      print('Error during edit category: $e');
      // Handle any other exceptions that might occur
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    try {
      var apiUrl = '${Api.baseUrl}/event-categories/delete/$categoryId';
      var headers = await Api.getHeaders();


      print('$categoryId');

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,

      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Category successfully edited');
        fetchCategory(); // Refresh the categoryList
      } else {
        // Handle different HTTP status codes or server response here
        print('Failed to edit category. Server response: ${response.body}');
        // You might want to display an appropriate error message to the user.
      }
    } catch (e) {
      print('Error during edit category: $e');
      // Handle any other exceptions that might occur
    }
  }
}
