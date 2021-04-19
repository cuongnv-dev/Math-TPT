import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/fill_number_inside_array_exe_controlle.dart';

class FillNumberInsideArrayExerciseBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<FillNumberInsideArrayExeController>(
      () => FillNumberInsideArrayExeController(),
    );
  }
}
