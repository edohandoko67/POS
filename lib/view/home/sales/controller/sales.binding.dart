import 'package:get/get.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

class SalesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesController>(() => SalesController());
  }
}