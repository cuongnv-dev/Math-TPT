import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/division_paragraph_exe_controller.dart';

class DivisionParagraphExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<DivisionParagraphExerciseController>(
      () => DivisionParagraphExerciseController(),
    );
  }
}
