import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/multiplication_paragraph_exe_controller.dart';

class MultiplicationParagraphExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<MultiplicationParagraphExerciseController>(
      () => MultiplicationParagraphExerciseController(),
    );
  }
}
