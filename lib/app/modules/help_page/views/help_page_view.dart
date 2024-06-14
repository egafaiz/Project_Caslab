import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/help_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPageView extends GetView<HelpPageController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelpPageController());

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
            top: 5, // Adjust this value to move the white background closer to the top
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
                child: Obx(() => ListView.builder(
                      itemCount: controller.helpList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                controller.helpList[index],
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF281C9D),
                                  fontSize: 18,
                                ),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios, color: const Color(0xFF281C9D)),
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Get.toNamed('/help1');
                                    break;
                                  case 1:
                                    Get.toNamed('/help2');
                                    break;
                                  case 2:
                                    Get.toNamed('/help3');
                                    break;
                                }
                              },
                            ),
                            Divider(
                              color: const Color(0xFF281C9D),
                            ),
                          ],
                        );
                      },
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
