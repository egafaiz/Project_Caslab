import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFF281C9D),
      appBar: buildAppBar(context, controller),
      body: buildBody(controller),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context, ProfileController controller) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: AppBar(
        backgroundColor: const Color(0xFF281C9D),
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 0),
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
                  'Profile',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    Get.toNamed('/edit-profile');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(ProfileController controller) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Container(
                height: 100,
                color: const Color(0xFF281C9D),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Obx(
                () => CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(controller.profileImage.value),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  controller.name.value,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF281C9D),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.email.value,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF281C9D),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    children: [
                      ProfileMenuItem(
                        icon: Icons.account_balance_wallet,
                        text: 'Dompet Saya',
                        onTap: () => Get.toNamed('/dompet-saya'),
                      ),
                      ProfileMenuItem(
                        icon: Icons.category,
                        text: 'Kategori',
                        onTap: () => Get.toNamed('/kategori'),
                      ),
                      ProfileMenuItem(
                        icon: Icons.help,
                        text: 'Bantuan dan Dukungan',
                        onTap: () => Get.toNamed('/help-page'),
                      ),
                      ProfileMenuItem(
                        icon: Icons.settings,
                        text: 'Pengaturan',
                        onTap: () => Get.toNamed('/setting-page'),
                      ),
                      ProfileMenuItem(
                        icon: Icons.info,
                        text: 'Tentang',
                        onTap: () => Get.toNamed('/about-page'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed('/homepage-1');
              break;
            case 1:
              Get.toNamed('/transaksi');
              break;
            case 2:
              Get.toNamed('/transaksi-baru');
              break;
            case 3:
              Get.toNamed('/anggaran');
              break;
            case 4:
              Get.toNamed('/profile');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey[400]),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz, color: Colors.grey[400]),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                color: Color(0xFF281C9D),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () => Get.toNamed('/transaksi-baru'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.grey[400]),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF281C9D)),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF281C9D)),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          color: const Color(0xFF281C9D),
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF281C9D)),
      onTap: onTap,
    );
  }
}
