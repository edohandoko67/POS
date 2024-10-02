import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salesforce/view/login/login.dart';

import '../../auth/utils/storage.dart';
import '../../routes/pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final Storage storage = Storage();
  final GetStorage box = GetStorage();
  late AnimationController controller;

  @override
  void initState() {
    super.initState(); // Memanggil super.initState() di awal

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Durasi animasi
    )..addListener(() {
      setState(() {});
    });

    controller.forward().whenComplete(() async {
      box.writeIfNull("isLoggedIn", false);
      final isLoggedIn = box.read("isLoggedIn") ?? false;

      if (isLoggedIn) {
        final roles = storage.getRole();
        String routedDirection;

        if (roles == 'ROLE_ADMIN') {
          routedDirection = Routes.HOME;
        } else if (roles == 'ROLE_CUSTOMER') {
          routedDirection = Routes.HOMEDRIVER;
        } else {
          routedDirection = Routes.LOGIN;
        }

        Get.offAllNamed(routedDirection); // Arahkan pengguna ke rute yang sesuai
      } else {
        Get.offAll(const LoginPage()); // Arahkan pengguna ke halaman login
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0),
            //   child: Row(
            //     children: [
            //       // SizedBox(
            //       //   width: 30,
            //       //   child: Image.asset('assets/images/logo.png'), // Ganti dengan logo Anda
            //       // ),
            //       // const SizedBox(width: 5),
            //       // const Text('|', style: TextStyle(fontSize: 15)),
            //       // const SizedBox(width: 5),
            //       // const Text(
            //       //   'Salesforce',
            //       //   style: TextStyle(
            //       //     fontFamily: 'Poppins',
            //       //     color: Color(0xFF954828),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 130),
            // Center(
            //   child: Image.asset(
            //     'assets/images/logo.png', // Ganti dengan logo Anda
            //     width: 150,
            //   ),
            // ),
            const SizedBox(height: 30),
            SpinKitWave(
              color: Colors.blueAccent,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
