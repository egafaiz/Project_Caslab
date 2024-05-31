import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFF281C9D),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Color(0xFF281C9D),
            automaticallyImplyLeading: false,
            flexibleSpace: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Get.back();
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Masuk',
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Selamat Datang',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF281C9D),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Halo, masuk untuk melanjutkan',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Image.asset(
                              'assets/images/Illustration (1).png', // Ensure this image exists in the specified path
                              height: 220,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: GoogleFonts.poppins(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 10),
                          Obx(() {
                            return TextField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: GoogleFonts.poppins(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: controller.togglePasswordVisibility,
                                ),
                              ),
                              obscureText: !controller.isPasswordVisible.value,
                              controller: controller.passwordController,
                            );
                          }),
                          SizedBox(height: 0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed('/email-otp');
                              },
                              child: Text('Lupa Sandi ?', style: TextStyle(color: Color(0xFF281C9D))),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF281C9D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size.fromHeight(50),
                            ),
                            onPressed: controller.login,
                            child: Text(
                              'MASUK',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Belum punya akun? ',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF281C9D),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/signup');
                                },
                                child: Text(
                                  'daftar',
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF281C9D),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
