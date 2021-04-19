import 'dart:math';

import 'package:get/instance_manager.dart';
import 'package:math/presentation/controller/natural_number_category_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Random>(Random(), permanent: true);
  }
}
