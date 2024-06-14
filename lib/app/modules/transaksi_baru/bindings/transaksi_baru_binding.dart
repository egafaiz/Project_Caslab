import 'package:get/get.dart';
import '../controllers/transaksi_baru_controller.dart';

class TransaksiBaruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiBaruController>(() => TransaksiBaruController());
  }
}
