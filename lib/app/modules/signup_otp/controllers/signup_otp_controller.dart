import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupOtpController extends GetxController {
  var otpController = TextEditingController();
  var isOtpSent = false.obs;
  var timerValue = 60.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timerValue.value = 60; // Reset timer to 60 seconds
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerValue.value > 0) {
        timerValue.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resendOtp() {
    // Implement OTP resend logic here
    startTimer();
    isOtpSent.value = true;
    Get.snackbar(
      'Success',
      'OTP has been resent',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void verifyOtp() {
    if (otpController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter the OTP',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Implement OTP verification logic here
      print("Entered OTP: ${otpController.text}");
      Get.toNamed('/signup-success');
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    timer?.cancel();
    super.onClose();
  }
}
