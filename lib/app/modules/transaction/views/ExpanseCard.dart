import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseCard extends StatelessWidget {
  final String date;
  final String day;
  final String total;
  final List<String> expenses;

  ExpenseCard({
    required this.date,
    required this.day,
    required this.total,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTransactionItem(
            '12 Mei 2024', ['Makanan & Minuman', 'Makanan & Minuman'], 'Rp. -194.000'),
        _buildTransactionItem(
            '13 Mei 2024', ['Makanan & Minuman', 'Makanan & Minuman'], 'Rp. -65.000'),
        _buildTransactionItem(
            '14 Mei 2024', ['Makanan & Minuman', 'Makanan & Minuman'], 'Rp. -98.000'),
        _buildTransactionItem(
            '15 Mei 2024', ['Makanan & Minuman', 'Makanan & Minuman'], 'Rp. -107.000'),
        _buildTransactionItem(
            '16 Mei 2024', ['Makanan & Minuman', 'Makanan & Minuman'], 'Rp. -209.000'),
      ],
    );
  }

  Widget _buildTransactionItem(String date, List<String> items, String harga) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF281C9D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.fastfood, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          item,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      harga,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
