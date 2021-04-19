import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/fill_number_inside_blank_exe_controlle.dart';

class FillNumberInsideBlankExerciseBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<FillNumberInsideBlankExeController>(
      () => FillNumberInsideBlankExeController(),
    );
  }
}
