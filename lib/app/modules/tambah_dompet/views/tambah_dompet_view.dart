import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_dompet_controller.dart';

class TambahDompetView extends GetView<TambahDompetController> {
  const TambahDompetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahDompetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TambahDompetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
