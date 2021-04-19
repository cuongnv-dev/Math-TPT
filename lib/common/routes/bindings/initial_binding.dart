import 'package:get/get.dart';
import 'package:math/data/core/local_storage_get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorage>(() => LocalStorageImpl());
  }
}
