import 'package:get/get.dart';

class PlusController extends GetxController {
  PlusController();

  final selectedIndex = 0.obs;

  void updateSelected(int selected) {
    selectedIndex.value = selected;
  }
}
