import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/division_choice_number_exe_controller.dart';


class DivisionChoiceAnswerExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<DivisionChoiceNumberExerciseController>(
      () => DivisionChoiceNumberExerciseController(),
    );
  }
}
