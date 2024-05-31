import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void resetPassword() {
    if (newPasswordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in both password fields',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (newPasswordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters long',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Implement your password reset logic here
      print("New Password: ${newPasswordController.text}");
      Get.toNamed('/password-changed');
    }
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
