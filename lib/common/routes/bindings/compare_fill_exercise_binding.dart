import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/compare_fill_exe_controller%20copy.dart';
import 'package:math/presentation/controller/natural_number_category_controller.dart';
import 'package:math/presentation/controller/plus_category_controller.dart';

class CompareFillExerciseBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<CompareFillExeController>(
      () => CompareFillExeController(),
    );
  }
}
