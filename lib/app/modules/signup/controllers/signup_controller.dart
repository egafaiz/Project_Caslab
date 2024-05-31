import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController(); // Updated to emailController
  var passwordController = TextEditingController();
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void register() {
    if (nameController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your name',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (emailController.text.isEmpty) { // Updated check for email
      Get.snackbar(
        'Error',
        'Please enter your email',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (!GetUtils.isEmail(emailController.text)) { // Updated validation for email
      Get.snackbar(
        'Error',
        'Please enter a valid email address',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your password',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (passwordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      print("Name: ${nameController.text}");
      print("Email: ${emailController.text}"); // Updated print statement for email
      print("Password: ${passwordController.text}");
      Get.toNamed('/signup-otp'); 
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose(); // Dispose the emailController
    passwordController.dispose();
    super.onClose();
  }
}
