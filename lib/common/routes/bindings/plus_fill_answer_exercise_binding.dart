import 'package:get/instance_manager.dart';

import 'package:math/presentation/controller/plus_fill_answer_exe_controlle.dart';

class PlusFillAnswerExeBinding implements Bindings {
  PlusFillAnswerExeBinding();
  @override
  void dependencies() {
    Get.create<PlusFillAnswerController>(
      () => PlusFillAnswerController(),
    );
  }
}
