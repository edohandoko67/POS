import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/widgets/custom.textfield.dart';

class PengaturanKeamanan extends GetView<HomeController> {
  const PengaturanKeamanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text('Pengaturan Keamanan', style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white
        ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Password Lama'),
              CustomTextField(
                hintText: '********',
                obsecureText: controller.isObsecure.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObsecure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ), onPressed: () {
                    controller.tooglesecure();
                },
              ),
              ),
              const SizedBox(height: 5,),
              const Text('Password Baru'),
              CustomTextField(
                hintText: '********',
                obsecureText: controller.isObsecureNew.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObsecureNew.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ), onPressed: () {
                  controller.tooglesecureNew();
                },
                ),
              ),
              const SizedBox(height: 5,),
              const Text('Ulangi Password Baru'),
              CustomTextField(
                hintText: '********',
                obsecureText: controller.isObsecureRepeat.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObsecureRepeat.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ), onPressed: () {
                  controller.tooglesecureRepeat();
                },
                ),
              ),
              const SizedBox(height: 7,),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3F8CE2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                    onPressed: () {},
                    child: Text('SIMPAN', style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                      color: Colors.white
                ),)),
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}
