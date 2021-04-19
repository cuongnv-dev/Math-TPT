import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/minus_paragraph_exe_controller.dart';



class MinusParagraphExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<MinusParagraphExerciseController>(
      () => MinusParagraphExerciseController(),
    );
  }
}
