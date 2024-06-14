// lib/app/modules/transaksi_baru/controllers/transaksi_baru_controller.dart
import 'package:get/get.dart';

class TransaksiBaruController extends GetxController {
  var amount = 0.obs;
  var selectedCategory = ''.obs;
  var note = ''.obs;
  var date = DateTime.now().obs;
  var wallet = ''.obs;

  void updateAmount(int value) {
    amount.value = value;
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
  }

  void updateNote(String newNote) {
    note.value = newNote;
  }

  void updateDate(DateTime newDate) {
    date.value = newDate;
  }

  void updateWallet(String newWallet) {
    wallet.value = newWallet;
  }
}
