import 'package:get/get.dart';

import '../controllers/help2_controller.dart';

class Help2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Help2Controller>(
      () => Help2Controller(),
    );
  }
}
