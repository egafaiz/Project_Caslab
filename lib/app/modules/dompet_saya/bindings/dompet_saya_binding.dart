import 'package:get/get.dart';

import '../controllers/dompet_saya_controller.dart';

class DompetSayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetSayaController>(
      () => DompetSayaController(),
    );
  }
}
