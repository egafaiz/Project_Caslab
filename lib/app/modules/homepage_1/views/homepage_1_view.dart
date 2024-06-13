import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homepage_1_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage1View extends GetView<Homepage1Controller> {
  const Homepage1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF281C9D),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Illustration.png'),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Hi, Adnan',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildWalletSection(),
                      const SizedBox(height: 20),
                      _buildExpenseReportSection(),
                      const SizedBox(height: 20),
                      _buildRecentTransactionsSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildWalletSection() {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF281C9D),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dompet Saya',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.account_balance_wallet, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Tunai',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Lihat semua',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[300], fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'Rp 2.000.000',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildExpenseReportSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF281C9D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Laporan Pengeluaran',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Melihat Laporan',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeFilterButton('Minggu', true),
              _buildTimeFilterButton('Bulan', false),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Rp 500.000',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
          ),
          Text(
            'Total pembelanjaan minggu ini - 20%',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildExpenseBar('Minggu ini', 0.4),
              _buildExpenseBar('Minggu lalu', 0.6),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pengeluaran teratas',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.fastfood, color: Colors.white),
              Text(
                'Makanan & Minuman',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
              Text(
                'Rp 285.000',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeFilterButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: isSelected ? const Color(0xFF281C9D) : Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildExpenseBar(String label, double value) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 100 * value,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRecentTransactionsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF281C9D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaksi Terkini',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Lihat Semua',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTransactionItem(
              'Makanan & Minuman', '28 April 2024', 'Rp 25.000'),
          _buildTransactionItem(
              'Kebutuhan Internet', '29 April 2024', 'Rp 50.000'),
          _buildTransactionItem(
              'Makanan & Minuman', '29 April 2024', 'Rp 15.000'),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String date, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.fastfood, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          child: NavigationBar(
            
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home",),
              NavigationDestination(icon: Icon(Icons.swap_horiz), label: ""),
              NavigationDestination(icon: Icon(Icons.add_circle), label: ""),
              NavigationDestination(icon: Icon(Icons.account_balance_wallet), label: ""),
              NavigationDestination(icon: Icon(Icons.person), label: ""),
            ],
           
            height: constraints.maxHeight * 0.1,
          ),
        );
      },
    );
  }
}
