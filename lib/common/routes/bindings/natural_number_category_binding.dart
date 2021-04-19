import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/natural_number_category_controller.dart';

class NaturalNumberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NaturalNumberController>(() => NaturalNumberController(),
        fenix: true);
  }
}
