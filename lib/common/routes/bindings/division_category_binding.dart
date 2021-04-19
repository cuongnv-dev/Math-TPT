import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/plus_category_controller.dart';

class DivisionBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<PlusController>(() => PlusController());
  }
}
