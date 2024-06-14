import 'package:get/get.dart';

class HelpPageController extends GetxController {
  // Implement HelpPageController

  final count = 0.obs;
  final _helpList = [
    'Basic Questions',
    'Privacy',
    'Finance Tips',
  ].obs;

  List<String> get helpList => _helpList;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
