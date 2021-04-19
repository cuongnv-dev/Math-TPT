import 'package:get/instance_manager.dart';


import 'package:math/presentation/controller/plus_paragraph_exe_controller.dart';

class PlusParagraphExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<PlusParagraphExerciseController>(
      () => PlusParagraphExerciseController(),
    );
  }
}
