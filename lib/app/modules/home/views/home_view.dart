import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % 3;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ).then((_) => _startAutoSlide());
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingPage(
                imagePath: 'assets/images/Group 520 (4).png',
                subtitle: 'CARA SEDERHANA MENJAGA KEUANGAN ANDA',
              ),
              OnboardingPage(
                imagePath: 'assets/images/Group 521.png',
                subtitle: 'KURANGI SEMUA PENGELUARAN YANG TIDAK PERLU',
                isCentered: true,
              ),
              OnboardingPage(
                imagePath: 'assets/images/Group 520 (5).png',
                subtitle: 'KELOLA SEMUA UANG ANDA DI SATU TEMPAT',
              ),
            ],
          ),
          Positioned(
            bottom: 100, 
            left: 20,
            right: 20,
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF281C9D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Get.toNamed('/signup');
                  },
                  child: Text(
                    'DAFTAR',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: Text(
                    'MASUK',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF281C9D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String subtitle;
  final bool isCentered;

  OnboardingPage({
    required this.imagePath,
    required this.subtitle,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        width: 350,
        height: 400, // Reduced height to make space for buttons
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Added space between to distribute space
          children: [
            if (isCentered) Spacer(),
            Image.asset(
              imagePath,
              fit: BoxFit.contain,
              width: isCentered ? 200 : 300,
              height: isCentered ? 200 : 300,
            ),
            if (isCentered) Spacer(),
            Spacer(), 
            Text(
              subtitle.toUpperCase(),
              style: GoogleFonts.poppins(
                color: Color(0xFF281C9D),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(), 
          ],
        ),
      ),
    );
  }
}

class HomeController extends GetxController {}
