import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPageView extends StatelessWidget {
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
                    'Pengaturan',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Tentang',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF281C9D),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: Text(
                        'Cara Pakai',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF281C9D),
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: const Color(0xFF281C9D)),
                      onTap: () {
                        Get.toNamed('/help-page');
                      },
                    ),
                    Divider(
                      color: const Color(0xFF281C9D),
                    ),
                    ListTile(
                      title: Text(
                        'Tentang Campus Cash',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF281C9D),
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: const Color(0xFF281C9D)),
                      onTap: () {
                        Get.toNamed('/about-page');
                      },
                    ),
                    Divider(
                      color: const Color(0xFF281C9D),
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
}
