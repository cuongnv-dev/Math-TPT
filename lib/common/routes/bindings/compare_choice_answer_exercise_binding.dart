import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/compare_choice_exe_controller.dart';

class CompareChoiceAnswerExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<CompareChoiceExeController>(
      () => CompareChoiceExeController(),
    );
  }
}
