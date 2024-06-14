import 'dart:io'; // Add this import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: controller.name.value);
    final emailController = TextEditingController(text: controller.email.value);

    return Scaffold(
      backgroundColor: const Color(0xFF281C9D),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // Adjust the height as needed
        child: AppBar(
          backgroundColor: const Color(0xFF281C9D),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 0), // Adjust the padding to position the content lower
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                    'Edit Profile',
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
          Positioned.fill(
            child: Container(
              color: const Color(0xFF281C9D),
            ),
          ),
          Positioned(
            top: 100, // Move the white background higher
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 16), // Adjust the top padding to accommodate the profile picture
              child: Column(
                children: [
                  const SizedBox(height: 70), // Space for the profile picture
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.editProfile(
                          nameController.text,
                          emailController.text,
                          controller.profileImage.value,
                        );
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF281C9D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16), // Adjust the vertical padding for height
                      ),
                      child: Text(
                        'SIMPAN',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40, // Move the profile picture higher
            left: MediaQuery.of(context).size.width / 2 - 60, // Center the profile picture
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _showImageSourceActionSheet(context);
                  },
                  child: Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.profileImage.value.isEmpty
                        ? const AssetImage('assets/default_profile_image.png')
                        : FileImage(File(controller.profileImage.value)),
                  )),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _showImageSourceActionSheet(context);
                  },
                  child: Text(
                    'Ganti Gambar',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF281C9D),
                      fontSize: 14,
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

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kamera'),
                onTap: () {
                  controller.pickImage(ImageSource.camera);
                  _showMessage(context, 'Kamera');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeri'),
                onTap: () {
                  controller.pickImage(ImageSource.gallery);
                  _showMessage(context, 'Galeri');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.file_present),
                title: const Text('File'),
                onTap: () {
                  controller.pickImage(ImageSource.gallery); // Menggunakan galeri untuk memilih file
                  _showMessage(context, 'File');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMessage(BuildContext context, String source) {
    final snackBar = SnackBar(content: Text('Memilih gambar dari $source'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
