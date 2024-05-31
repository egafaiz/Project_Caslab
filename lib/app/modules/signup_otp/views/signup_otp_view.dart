import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/signup_otp_controller.dart';

class SignupOtpView extends GetView<SignupOtpController> {
  const SignupOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Verifikasi OTP',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24, // Match the app bar title size of other pages
          ),
        ),
        centerTitle: false, // Align title to the left
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0), // Move form slightly downwards
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Masukan Kode OTP',
                            labelStyle: GoogleFonts.poppins(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          controller: controller.otpController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Obx(() {
                          return controller.timerValue.value > 0
                              ? Text(
                                  '${controller.timerValue.value}s',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF281C9D),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: Size(100, 50), // Ensure the button is large enough
                                  ),
                                  onPressed: controller.resendOtp,
                                  child: Text(
                                    'Kirim Ulang',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kode OTP telah dikirimkan',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF281C9D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                    ),
                    onPressed: controller.verifyOtp,
                    child: Text(
                      'KIRIM',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
