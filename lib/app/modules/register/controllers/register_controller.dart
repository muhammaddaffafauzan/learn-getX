import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../providers/api.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confPassword = ''.obs;

  void onUsernameChanged(String value) {
    username.value = value;
  }

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  void onConfPasswordChanged(String value) {
    confPassword.value = value;
  }

  Future<void> register() async {
    try {
      var response = await _performRegistration();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 201) {
        Get.offAllNamed('/login');
        Get.snackbar('Success', 'Registration successful. Please login.');
      } else {
        Get.snackbar('Error', 'Registration failed. ${responseBody['msg']}');
      }
    } catch (e) {
      print('Error during registration: $e');
      Get.snackbar('Error', 'An error occurred during registration.');
    }
  }

  Future<http.Response> _performRegistration() async {
    var apiUrl = '/auth/register';
    var requestBody = {
      'username': username.value,
      'email': email.value,
      'password': password.value,
      'confPassword': confPassword.value
    };

    return await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
  }

  void goToLogin() {
    Get.toNamed('/login');
  }
}
