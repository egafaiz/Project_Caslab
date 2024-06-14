import 'package:get/get.dart';

class ProfileController extends GetxController {
  final name = 'Adnan Amhar'.obs;
  final email = 'adnanamhar12@gmail.com'.obs;
  final profileImage = 'assets/images/profile_picture.png'.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void editProfile(String newName, String newEmail, String newImage) {
    name.value = newName;
    email.value = newEmail;
    profileImage.value = newImage;
  }
}
