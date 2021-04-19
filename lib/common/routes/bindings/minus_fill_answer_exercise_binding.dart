import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/minus_fill_answer_exe_controlle.dart';

class MinusFillAnswerExeBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<MinusFillAnswerController>(
      () => MinusFillAnswerController(),
    );
  }
}
