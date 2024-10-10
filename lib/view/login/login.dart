import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/login/forgot.password.dart';
import 'package:salesforce/view/login/login.controller.dart';
import 'package:salesforce/widgets/custom.textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideInAnimation;

  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _fadeInAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _slideInAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _slideInAnimation,
                    child: Text(
                      'Sales App',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SlideTransition(
                    position: _slideInAnimation,
                    child: Text(
                      'Aplikasi untuk mempermudah transaksi',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SlideTransition(
                    position: _slideInAnimation,
                    child: SizedBox(
                        width: screenWidth * 0.8,
                        child: Image.asset('assets/images/login.png')),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SlideTransition(
                    position: _slideInAnimation,
                    child: CustomTextField(
                      controller: controller.email,
                      hintText: 'Enter Email',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SlideTransition(
                    position: _slideInAnimation,
                    child: Obx(() => CustomTextField(
                          controller: controller.password,
                          hintText: 'Password',
                          obsecureText: controller.isObsecure.value,
                          suffixIcon: IconButton(
                            icon: Icon(controller.isObsecure.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              controller.toogleSecure();
                            },
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SlideTransition(
                    position: _slideInAnimation,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4461F2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            controller.validateLogin();
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SlideTransition(
                      position: _slideInAnimation, child: const Text('or')),
                  const SizedBox(
                    height: 5,
                  ),
                  SlideTransition(
                    position: _slideInAnimation,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8691C3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            //Get.toNamed(Routes.FORGOT_PASSWORD);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            'Lupa Password',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  // ElevatedButton(
                  //     onPressed: showToast,
                  //     child: const Text("Test"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static const MethodChannel channel = MethodChannel("edo");
  void showToast() async {
    String a = await channel.invokeMethod("tesButton");
    print(a);
  }
}

class AnimatedCheckmark extends StatefulWidget {
  const AnimatedCheckmark({super.key});

  @override
  State<AnimatedCheckmark> createState() => _AnimatedCheckmarkState();
}

class _AnimatedCheckmarkState extends State<AnimatedCheckmark>
    with SingleTickerProviderStateMixin {
  LoginController controller = LoginController();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child)
    {
      return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: _animation.value,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                if (_animation.value == 1)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 50,
                  ),
              ],
            );
          });
      }
    );
  }
}
