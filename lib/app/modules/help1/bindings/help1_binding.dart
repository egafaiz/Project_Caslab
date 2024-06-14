import 'package:get/get.dart';

import '../controllers/help1_controller.dart';

class Help1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Help1Controller>(
      () => Help1Controller(),
    );
  }
}
