import 'package:get/get.dart';
import 'package:salesforce/view/home/home.controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}