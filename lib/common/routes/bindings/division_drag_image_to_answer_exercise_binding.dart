import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/division_drag_image_to_answer_controller.dart';


class DivisionDragImageToAnswerBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<DivisionDragImageToAnswerController>(
      () => DivisionDragImageToAnswerController(),
    );
  }
}
