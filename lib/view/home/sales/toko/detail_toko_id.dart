import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/auth/service/api.constant.dart';
import 'package:salesforce/view/home/home.controller.dart';

import '../../../../auth/model/toko.dart';

class DetailTokoId extends GetView<HomeController> {
  DetailTokoId({super.key});

  final TokoModel args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text('Informasi Toko', style: GoogleFonts.poppins(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
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
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network((ApiConstant.baseUrl + args.image_detail.toString())),
                const SizedBox(height: 5,),
                Text(
                  "Nama Toko",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Pastikan warna kontras
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  args.nameToko ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.black, // Pastikan warna kontras
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Alamat Toko",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Pastikan warna kontras
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  args.address ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.black, // Pastikan warna kontras
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "No. Telepon Toko",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Pastikan warna kontras
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  args.number ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.black, // Pastikan warna kontras
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
