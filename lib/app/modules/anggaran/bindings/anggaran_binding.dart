import 'package:get/get.dart';

import '../controllers/anggaran_controller.dart';

class AnggaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnggaranController>(
      () => AnggaranController(),
    );
  }
}
