import 'package:get/get.dart';

class MinusController extends GetxController {
  MinusController();

  final selectedIndex = 0.obs;

  void updateSelected(int selected) {
    selectedIndex.value = selected;
  }
}
