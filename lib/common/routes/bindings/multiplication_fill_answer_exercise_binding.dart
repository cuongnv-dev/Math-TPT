import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/multiplication_fill_answer_exe_controlle.dart';

class MultiplicationFillAnswerExeBinding implements Bindings {
  MultiplicationFillAnswerExeBinding();
  @override
  void dependencies() {
    Get.create<MultiplicationFillAnswerController>(
      () => MultiplicationFillAnswerController(),
    );
  }
}
