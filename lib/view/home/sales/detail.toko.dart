import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:salesforce/auth/model/toko.dart';
import 'package:salesforce/auth/service/api.constant.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

import '../../../routes/pages.dart';

class DetailToko extends StatelessWidget {
  DetailToko({super.key});

  TokoModel tokoModel = Get.arguments;
  SalesController controller = Get.put(SalesController());
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text(
          'Detail Toko',
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network((ApiConstant.baseUrl + tokoModel.image_detail.toString())),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 25),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(tokoModel.nomor_so ?? '')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(tokoModel.nameToko ?? '')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(tokoModel.address ?? '')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: screenWidth * 0.45,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(tokoModel.provinsi ?? '')),
                    Container(
                        width: screenWidth * 0.45,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(tokoModel.kota ?? '')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: screenWidth * 0.45,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(tokoModel.kecamatan ?? '')),
                    Container(
                        width: screenWidth * 0.45,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(tokoModel.desa ?? '')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(tokoModel.owner ?? '')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(tokoModel.number ?? '')),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(55, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xFF3F8CE2)),
                        onPressed: () {
                            Get.toNamed(Routes.INFOTOKO);
                        },
                        child: Text('Informasi', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(55, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xFFDFA978)),
                        onPressed: () {
                          Get.toNamed(Routes.MAPS, arguments: controller);
                        },
                        child: Text('Lokasi', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(55, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xFF787878)),
                        onPressed: () {
                          Get.toNamed(Routes.UPDATETOKO);
                        },
                        child: Text('Update', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
