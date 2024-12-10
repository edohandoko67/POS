import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';


class ImageKeterangan extends StatefulWidget {
  final String imagePath;
  const ImageKeterangan({required this.imagePath});

  @override
  State<ImageKeterangan> createState() => _ImageKeteranganState();
}

class _ImageKeteranganState extends State<ImageKeterangan> {
  Position position = Get.arguments as Position;

  //f11
  SalesController controller = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text(
          'Absen Toko',
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Image.file(File(widget.imagePath))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text('${position.latitude}, ${position.longitude}')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: controller.keterangan,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    //maxLines: null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xFF3F8CE2)),
                        onPressed: () {
                          controller.checklist.value = !controller.checklist.value;
                          // if (controller.checklist.value) {
                          //   controller.createAbsen();
                          //   print('tes');
                          // }
                        },
                        child: Obx(() {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: controller.checklist.value
                                ? Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        key: ValueKey('checked'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Proses Absensi',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                : Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.white,
                                        key: ValueKey('unchecked'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Proses Absensi',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.grey),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Kembali',
                            style: GoogleFonts.poppins(color: Colors.white),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
