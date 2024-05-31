import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EmailOtpController extends GetxController {
  var emailController = TextEditingController();

  void verifyEmail() {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email address',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Implement email verification logic here
      print("Entered Email: ${emailController.text}");
      Get.toNamed('/login-otp'); // Navigate to the login OTP screen
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
