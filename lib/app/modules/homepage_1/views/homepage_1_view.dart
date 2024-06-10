import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homepage_1_controller.dart';

class Homepage1View extends GetView<Homepage1Controller> {
  const Homepage1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Homepage1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
