import 'package:get/get.dart';

import '../controllers/help3_controller.dart';

class Help3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Help3Controller>(
      () => Help3Controller(),
    );
  }
}
