import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/password_changed_controller.dart';

class PasswordChangedView extends GetView<PasswordChangedController> {
  const PasswordChangedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF281C9D)),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Illustration 1.png', // Ensure this image exists in the specified path
              height: 220,
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 2),
              child: Text(
                'Password Berhasil Diubah',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF281C9D),
                ),
              ),
            ),
            SizedBox(height: 40),
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF281C9D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                ),
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text(
                  'OKE',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
