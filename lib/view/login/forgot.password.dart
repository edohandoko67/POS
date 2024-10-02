import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/login/login.controller.dart';
import 'package:salesforce/widgets/custom.textfield.dart';
import 'package:get/get.dart';

import '../../routes/pages.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideInAnimation;

  LoginController controller = LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _fadeInAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn)
    );
    _slideInAnimation = Tween<Offset>(
      begin: const Offset(0.3, 1.2),
      end: const Offset(0,0),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text('Lupa Password', style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white
        ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Get.toNamed(Routes.LOGIN);
            //Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: SlideTransition(
                        position: _slideInAnimation,
                        child: Text('Sales App', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      subtitle: SlideTransition(
                        position: _slideInAnimation,
                        child: Text('Aplikasi untuk mempermudah transaksi', style: GoogleFonts.poppins(
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7,),
                    SlideTransition(
                      position: _slideInAnimation,
                      child: Image.asset('assets/images/pos.png'),
                    ),
                    const SizedBox(height: 50,),
                    SlideTransition(
                      position: _slideInAnimation,
                      child: const CustomTextField(
                        hintText: 'Enter Email',
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SlideTransition(
                      position: _slideInAnimation,
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4461F2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            onPressed: () {
                              controller.validateForgot();
                            },
                            child: Text('Sign In', style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),)),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      )
    );
  }
}
