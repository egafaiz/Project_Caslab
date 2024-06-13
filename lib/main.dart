import 'package:campuscash/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campuscash/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Campus Cash',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
