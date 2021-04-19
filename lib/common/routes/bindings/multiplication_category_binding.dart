import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/natural_number_category_controller.dart';
import 'package:math/presentation/controller/plus_category_controller.dart';

class MultiplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<PlusController>(() => PlusController());
  }
}
