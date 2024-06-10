import 'package:get/get.dart';

import '../controllers/homepage_1_controller.dart';

class Homepage1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Homepage1Controller>(
      () => Homepage1Controller(),
    );
  }
}
