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
        title: Text('Transaksi Baru',
            style: GoogleFonts.poppins(color: Colors.white)),
        backgroundColor: const Color(0xFF281C9D),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildAmountInput(),
              SizedBox(height: 20),
              _buildCategorySelection(context),
              SizedBox(height: 20),
              _buildNoteInput(),
              SizedBox(height: 20),
              _buildDatePicker(context),
              SizedBox(height: 20),
              _buildWalletSelection(context),
              SizedBox(height: 20),
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
                ListTile(
                  title: const Text('Transportasi'),
                  onTap: () {
                    controller.updateCategory('Transportasi');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Belanja'),
                  onTap: () {
                    controller.updateCategory('Belanja');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Hiburan'),
                  onTap: () {
                    controller.updateCategory('Hiburan');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Kesehatan'),
                  onTap: () {
                    controller.updateCategory('Kesehatan');
                    Navigator.of(context).pop();
                  },
                ),
                // Add more category options here if needed
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
                ListTile(
                  title: const Text('Bank'),
                  onTap: () {
                    controller.updateWallet('Bank');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('E-Wallet'),
                  onTap: () {
                    controller.updateWallet('E-Wallet');
                    Navigator.of(context).pop();
                  },
                ),
                // Add more wallet options here if needed
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
      child: Text('Simpan', style: GoogleFonts.poppins(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF281C9D),
      ),
    );
  }
}
