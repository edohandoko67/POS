import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:salesforce/auth/service/auth.service.dart';
import 'package:salesforce/utils/storage.dart';
import 'package:salesforce/repository/repository.dart';

import '../../routes/pages.dart';
import '../../utils/utils.dart';
import 'login.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Storage storage = Storage();
  AuthService service = AuthService();
  Repository repository = Repository();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLogin = true.obs;
  RxBool isObsecure = true.obs;
  RxBool userLevel = false.obs;
  final selectedGender = '1'.obs;

  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideInAnimation;

  @override
  void onInit() {
    super.onInit();
    final number = storage.getNumber();
    print('number $number');

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _slideInAnimation = Tween<Offset>(
      begin: const Offset(0.3, 1.2),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  AnimationController get animationController => _animationController;

  Animation<double> get fadeInAnimation => _fadeInAnimation;

  Animation<Offset> get slideInAnimation => _slideInAnimation;

  void login() {
    isLogin.value = true;
    Map data = {'username': email.text, 'password': password.text};
    repository.login(data).then((value) {
      isLogin.value = false;
      Utils.snackBar('Login', 'LoginSuccessfully');
      final roles = storage.getRole();
      String? routedDirection;

      if (roles == "ROLE_ADMIN") {
        routedDirection = Routes.HOME;
      } else if (roles == "ROLE_CUSTOMER") {
        routedDirection = Routes.HOMEDRIVER;
      } else {
        routedDirection = Routes.LOGIN;
      }

      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
            contentPadding: const EdgeInsets.all(20.0),
            title: const AnimatedCheckmark(),
            content: SizedBox(
              height: 80,
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Selamat Datang\n',
                        ),
                        TextSpan(
                          text: storage.getName(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(color: Colors.black),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (routedDirection != null) {
                    Get.offAllNamed(routedDirection!);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2DCE89),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Oke',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
      );
    }).onError((error, stackTrace) {
      isLogin.value = false;
      Utils.snackBar('error', error.toString());
    });
  }

  void validateLogin() {
    if (email.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Harap mengisi alamat email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 2), // Durasi popup
        animationDuration: const Duration(milliseconds: 800), // Durasi animasi
      );
    } else if (password.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Harap mengisi password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 2), // Durasi popup
        animationDuration: const Duration(milliseconds: 800), // Durasi animasi
      );
    } else {
      login();
    }
  }

  void validateForgot() {
    if (email.text.isEmpty) {
      Get.snackbar('Error', 'Harap mengisi Email',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(milliseconds: 800));
    } else {
      //reset();
    }
  }

  void toogleSecure() {
    isObsecure.value = !isObsecure.value;
  }

  // Rx<LoginModel> loginModel = LoginModel().obs;

  // Future<void> login() async {
  //   try {
  //     LoginModel loginModel = await service.login({
  //       'username': email.text,
  //       'password': password.text,
  //     });
  //     if (loginModel.isSuccess) {
  //       final roles = storage.getRole();
  //       String? routedDirection;
  //
  //       if (roles == "ROLE_ADMIN") {
  //         routedDirection = Routes.HOME;
  //       } else if (roles == "ROLE_CUSTOMER") {
  //         routedDirection = Routes.HOMEDRIVER;
  //       } else {
  //         // Tangani kasus jika roles tidak dikenali
  //         routedDirection = Routes.LOGIN;
  //       }
  //
  //       Get.dialog(
  //         barrierDismissible: false,
  //         AlertDialog(
  //           contentPadding: const EdgeInsets.all(20.0),
  //           title: const AnimatedCheckmark(),
  //           content: SizedBox(
  //             height: 80,
  //             child: Column(
  //               children: [
  //                 const SizedBox(height: 16.0),
  //                 RichText(
  //                   textAlign: TextAlign.center,
  //                   text: TextSpan(
  //                     style: const TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 16.0,
  //                     ),
  //                     children: [
  //                       const TextSpan(
  //                         text: 'Selamat Datang\n',
  //                       ),
  //                       TextSpan(
  //                         text: storage.getName(),
  //                         style: const TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10.0),
  //                 const Divider(color: Colors.black),
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             ElevatedButton(x
  //               onPressed: () {
  //                 if (routedDirection != null) {
  //                   Get.offAllNamed(routedDirection!);
  //                 }
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: const Color(0xFF2DCE89),
  //                 minimumSize: const Size.fromHeight(50),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //               ),
  //               child: const Text(
  //                 'Oke',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     } else {
  //       // Tangani kasus jika login gagal
  //       Get.snackbar('Login Gagal', 'Username atau password salah.');
  //     }
  //   } catch (e) {
  //     // Tangani kesalahan jaringan atau lainnya
  //     Get.snackbar('Error', 'Terjadi kesalahan saat login.');
  //   }
  // }

  Future<void> logout() async {
    storage.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
