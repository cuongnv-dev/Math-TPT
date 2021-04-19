import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/multiplication_choice_number_exe_controller.dart';

class MultiplicationChoiceAnswerExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<MultiplicationChoiceNumberExerciseController>(
      () => MultiplicationChoiceNumberExerciseController(),
    );
  }
}
