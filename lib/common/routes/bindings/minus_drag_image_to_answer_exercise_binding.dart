import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/minus_drag_image_to_answer_controller.dart';
import 'package:math/presentation/controller/plus_drag_image_to_answer_controller.dart';

class MinusDragImageToAnswerBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<MinusDragImageToAnswerController>(
      () => MinusDragImageToAnswerController(),
    );
  }
}
