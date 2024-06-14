import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/transaksi_baru_controller.dart';

class TransaksiBaruView extends GetView<TransaksiBaruController> {
  const TransaksiBaruView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi Baru', style: GoogleFonts.poppins()),
        backgroundColor: const Color(0xFF281C9D),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildAmountInput(),
              _buildCategorySelection(context),
              _buildNoteInput(),
              _buildDatePicker(context),
              _buildWalletSelection(context),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Masukkan jumlah',
        prefixIcon: Icon(Icons.attach_money),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        controller.updateAmount(int.tryParse(value) ?? 0);
      },
    );
  }

  Widget _buildCategorySelection(BuildContext context) {
    return ListTile(
      title: const Text('Pilih Kategori'),
      subtitle: Obx(() => Text(controller.selectedCategory.value.isEmpty
          ? 'Pilih kategori'
          : controller.selectedCategory.value)),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        _showCategoryDialog(context);
      },
    );
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Kategori'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('Makanan & Minuman'),
                  onTap: () {
                    controller.updateCategory('Makanan & Minuman');
                    Navigator.of(context).pop();
                  },
                ),
                // Tambahkan kategori lainnya di sini
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoteInput() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Catatan',
        prefixIcon: Icon(Icons.note),
      ),
      onChanged: (value) {
        controller.updateNote(value);
      },
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return ListTile(
      title: const Text('Pilih Tanggal'),
      subtitle: Obx(() => Text(controller.date.value.toLocal().toString())),
      trailing: const Icon(Icons.calendar_today),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: controller.date.value,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        ).then((date) {
          if (date != null) {
            controller.updateDate(date);
          }
        });
      },
    );
  }

  Widget _buildWalletSelection(BuildContext context) {
    return ListTile(
      title: const Text('Pilih Dompet'),
      subtitle: Obx(() => Text(controller.wallet.value.isEmpty
          ? 'Pilih dompet'
          : controller.wallet.value)),
      trailing: const Icon(Icons.account_balance_wallet),
      onTap: () {
        _showWalletDialog(context);
      },
    );
  }

  void _showWalletDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Dompet'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('Tunai'),
                  onTap: () {
                    controller.updateWallet('Tunai');
                    Navigator.of(context).pop();
                  },
                ),
                // Tambahkan pilihan dompet lainnya di sini
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Simpan transaksi
      },
      child: Text('Simpan', style: GoogleFonts.poppins()),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF281C9D),
      ),
    );
  }
}
