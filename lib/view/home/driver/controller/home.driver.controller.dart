import 'package:get/get.dart';
// import 'package:salesforce/auth/service/auth.service.dart';
// import '../../../../auth/model/toko.dart';
import '../../../../utils/storage.dart';

class HomeDriverBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDriverController>(() => HomeDriverController());
  }
}

class HomeDriverController extends GetxController {
  final Storage storage = Storage();
  // AuthService service = AuthService();

  RxInt currentIndex = 0.obs;
  RxBool checklist = true.obs;
  RxBool isLogin = false.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    isLogin.value = storage.isLogin();
    print(isLogin.value);
    final number = storage.getNumber();
    print('number $number');
   // getDataToko();
    super.onInit();
  }

  // RxList<TokoModel> listToko = <TokoModel>[].obs;
  // Future<void> getDataToko() async {
  //   try {
  //     isLoading.value = true;
  //     listToko.value = await service.listToko({
  //       "" : ""
  //     });
  //   } catch (e, stackTrace) {
  //     print("error:  $e");
  //     print("stackTrace: $stackTrace");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}