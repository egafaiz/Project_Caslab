import 'package:get/get.dart';

import '../controllers/login_success_controller.dart';

class LoginSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginSuccessController>(
      () => LoginSuccessController(),
    );
  }
}
