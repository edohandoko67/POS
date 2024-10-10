import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:salesforce/widgets/custom.card.dart';

class InformasiToko extends StatelessWidget {
  InformasiToko({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text(
          'Informasi Toko',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/toko.png'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Identitas Toko', style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                child: Column(
                  children: [
                    cardMainMenu(title: 'Kode Customer', inSubtitle: ":", subtitle: "Kode Customer"),
                    cardMainMenu(title: 'Nama Toko', inSubtitle: ":", subtitle: "Nama Toko"),
                    cardMainMenu(title: 'Alamat Toko', inSubtitle: ":", subtitle: "Alamat Toko"),
                    cardMainMenu(title: 'Alamat Pengiriman', inSubtitle: ":", subtitle: "Alamat Pengiriman"),
                    cardMainMenu(title: 'Alamat Lain', inSubtitle: ":", subtitle: "Alamat Lain"),
                    cardMainMenu(title: 'Tipe Outlet', inSubtitle: ":", subtitle: "Tipe Outlet"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Identitas Pribadi', style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                child: Column(
                  children: [
                    cardMainMenu(title: 'Nama Pemilik Toko', inSubtitle: ":", subtitle: "Nama Pemilik Toko"),
                    cardMainMenu(title: 'No. HP Pemilik', inSubtitle: ":", subtitle: "No. HP Pemilik"),
                    cardMainMenu(title: 'NIK (No. KTP)', inSubtitle: ":", subtitle: "NIK (No. KTP)"),
                    cardMainMenu(title: 'Status Pajak', inSubtitle: ":", subtitle: "Status Pajak"),
                    cardMainMenu(title: 'No. NPWP', inSubtitle: ":", subtitle: "No. NPWP"),
                    cardMainMenu(title: 'Nama NPWP', inSubtitle: ":", subtitle: "Nama NPWP"),
                    cardMainMenu(title: 'Alamat NPWP', inSubtitle: ":", subtitle: "Alamat NPWP"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Lainnya', style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 150.0),
                child: Column(
                  children: [
                    cardMainMenu(title: 'Catatan', inSubtitle: ":", subtitle: "Catatan"),
                    cardMainMenu(title: 'TOP', inSubtitle: ":", subtitle: "TOP"),
                    cardMainMenu(title: 'Limit Kredit', inSubtitle: ":", subtitle: "Limit Kredit"),
                    cardMainMenu(title: 'Grup Diskon', inSubtitle: ":", subtitle: "Grup Diskon"),
                    cardMainMenu(title: 'Week (Minggu Ke)', inSubtitle: ":", subtitle: "Week (Minggu Ke)"),
                    cardMainMenu(title: 'Hari Kunjungan', inSubtitle: ":", subtitle: "Hari Kunjungan"),
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
