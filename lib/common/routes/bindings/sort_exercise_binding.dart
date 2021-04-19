import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/division_choice_number_exe_controller.dart';
import 'package:math/presentation/controller/sort_exercise_controller.dart';

class SortExerciseBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<SortExerciseController>(
      () => SortExerciseController(),
    );
  }
}
