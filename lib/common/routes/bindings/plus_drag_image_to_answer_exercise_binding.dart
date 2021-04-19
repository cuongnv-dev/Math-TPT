import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/plus_drag_image_to_answer_controller.dart';


class PlusDragImageToAnswerBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<PlusDragImageToAnswerController>(
      () => PlusDragImageToAnswerController(),
    );
  }
}
