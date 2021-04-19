import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/division_fill_answer_exe_controlle.dart';


class DivisionFillAnswerExeBinding implements Bindings {
  DivisionFillAnswerExeBinding();
  @override
  void dependencies() {
    Get.create<DivisionFillAnswerController>(
      () => DivisionFillAnswerController(),
    );
  }
}
