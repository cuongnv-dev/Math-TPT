import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/choice_number_exe_controller.dart';

class ChoiceNumberExerciseBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<ChoiceNumberExerciseController>(
      () => ChoiceNumberExerciseController(),
    );
  }
}
