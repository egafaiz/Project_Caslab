import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dompet_saya_controller.dart';

class DompetSayaView extends GetView<DompetSayaController> {
  const DompetSayaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DompetSayaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DompetSayaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
