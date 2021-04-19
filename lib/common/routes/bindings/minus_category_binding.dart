import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/minus_category_controller.dart';

class MinusBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<MinusController>(() => MinusController());
  }
}
