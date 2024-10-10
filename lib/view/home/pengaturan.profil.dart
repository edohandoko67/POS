import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/view/login/login.controller.dart';
import 'package:salesforce/widgets/custom.textfield.dart';

class PengaturanProfile extends GetView<LoginController> {
  const PengaturanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text('Pengaturan Profil', style: GoogleFonts.poppins(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama Lengkap'),
              CustomTextField(
                hintText: controller.storage.getName(),
              ),
              const SizedBox(height: 10,),
              const Text('Jenis Kelamin'),
              Row(
                children: [
                  Obx(() => Radio<String>(
                    value: '0',
                    groupValue: controller.selectedGender.value,
                    onChanged: (value) {
                      controller.selectedGender.value = value!;
                    },
                  )),
                  const Text('Laki - laki'),
                  Obx(() => Radio<String>(
                    value: '1',
                    groupValue: controller.selectedGender.value,
                    onChanged: (value) {
                      controller.selectedGender.value = value!;
                    },
                  )),
                  const Text('Perempuan')
                ],
              ),
              const Text('No. Telepon'),
              CustomTextField(
                hintText: controller.storage.getNumber(),
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
    );
  }
}
