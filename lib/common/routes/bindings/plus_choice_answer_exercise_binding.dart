import 'package:get/instance_manager.dart';

import 'package:math/presentation/controller/plus_choice_number_exe_controller.dart';

class PlusChoiceAnswerExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<PlusChoiceNumberExerciseController>(
      () => PlusChoiceNumberExerciseController(),
    );
  }
}
