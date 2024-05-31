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
      title: 'Your App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
