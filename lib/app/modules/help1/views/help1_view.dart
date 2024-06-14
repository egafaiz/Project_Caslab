import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Help1View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: const Color(0xFF281C9D),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Bantuan',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF281C9D),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: ListView(
                  children: [
                    buildHelpItem(
                      context,
                      'Apa itu Campus Cash?',
                      'Campus Cash adalah aplikasi keuangan yang dirancang khusus untuk mahasiswa. Aplikasi ini memiliki berbagai fitur untuk membantu mahasiswa mengelola keuangan mereka dengan lebih baik. Dengan Campus Cash, Anda dapat:\n\n'
                      '• Menyimpan Data Keuangan: Simpan semua data pengeluaran dan pemasukan Anda secara aman dan terorganisir.\n'
                      '• Mencatat Pengeluaran dan Pemasukan: Catat setiap transaksi pengeluaran dan pemasukan Anda secara rinci, sehingga Anda selalu mengetahui status keuangan Anda.\n'
                      '• Laporan Keuangan: Aplikasi ini juga menyediakan laporan keuangan yang mudah dibaca untuk membantu Anda memahami pola pengeluaran dan pemasukan Anda.\n'
                      '• Pengingat Pembayaran: Dapatkan pengingat untuk membayar tagihan tepat waktu agar Anda tidak pernah melewatkan pembayaran penting.\n\n'
                      'Campus Cash dirancang untuk membantu mahasiswa mengatur keuangan mereka dengan mudah dan efisien, memastikan bahwa mereka dapat fokus pada studi mereka tanpa khawatir tentang masalah keuangan.',
                    ),
                    buildHelpItem(
                      context,
                      'Cara menambahkan transaksi baru?',
                      'Berikut adalah cara untuk menambahkan transaksi baru pada aplikasi Campus Cash:\n\n'
                      '1. Buka aplikasi Campus Cash dan masuk ke halaman utama.\n'
                      '2. Klik tombol tambah (+) di bagian bawah layar.\n'
                      '3. Isi formulir transaksi dengan informasi yang diperlukan, seperti jumlah, kategori, dan tanggal transaksi.\n'
                      '4. Klik simpan untuk menyimpan transaksi baru Anda.',
                    ),
                    buildHelpItem(
                      context,
                      'Cara melihat riwayat transaksi',
                      'Untuk melihat riwayat transaksi pada aplikasi Campus Cash, ikuti langkah-langkah berikut:\n\n'
                      '1. Buka aplikasi Campus Cash dan masuk ke halaman utama.\n'
                      '2. Klik menu riwayat di bagian bawah layar.\n'
                      '3. Anda akan melihat daftar semua transaksi yang telah Anda catat. Gunakan filter atau fitur pencarian untuk menemukan transaksi tertentu.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHelpItem(BuildContext context, String title, String content) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF281C9D),
                      fontSize: 18,
                    ),
                  ),
                  content: Text(
                    content,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF281C9D),
                      fontSize: 16,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'Tutup',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF281C9D),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: ListTile(
            title: Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color(0xFF281C9D),
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: const Color(0xFF281C9D)),
          ),
        ),
        Divider(
          color: const Color(0xFF281C9D),
        ),
      ],
    );
  }
}
