import 'package:get/get.dart';

import 'home_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

  }
}