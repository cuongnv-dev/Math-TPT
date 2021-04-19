import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/minus_choice_number_exe_controller.dart';

class MinusChoiceAnswerExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<MinusChoiceNumberExerciseController>(
      () => MinusChoiceNumberExerciseController(),
    );
  }
}
