import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/compare_best_exe_controller.dart';

class CompareChoiceBestExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<CompareBestExeController>(
      () => CompareBestExeController(),
    );
  }
}
