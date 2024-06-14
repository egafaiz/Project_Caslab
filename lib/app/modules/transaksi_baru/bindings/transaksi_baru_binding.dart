// lib/app/modules/transaksi_baru/bindings/transaksi_baru_binding.dart
import 'package:get/get.dart';
import '../controllers/transaksi_baru_controller.dart';

class TransaksiBaruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiBaruController>(() => TransaksiBaruController());
  }
}
