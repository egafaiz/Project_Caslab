import 'package:get/get.dart';

import '../controllers/tambah_dompet_controller.dart';

class TambahDompetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahDompetController>(
      () => TambahDompetController(),
    );
  }
}
