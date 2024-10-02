import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salesforce/auth/model/toko.dart';
import 'package:salesforce/routes/pages.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/view/home/sales/toko/toko.dart';

class DetailMaps extends GetView<HomeController> {
  const DetailMaps({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.8,
                child: Obx(() {
                  return GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    mapType: MapType.hybrid,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: controller.officeLocation.value,
                      zoom: 18.0,
                    ),
                    markers: controller.markers,
                  );
                }),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pilih lokasi', style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black, // Pastikan warna kontras
                    ),),
                    Obx(() => DropdownMenu<TokoModel>(
                      width: double.infinity,
                      dropdownMenuEntries: controller.listToko.map((TokoModel userArea) {
                        return DropdownMenuEntry<TokoModel>(
                          value: userArea,
                          label: userArea.nameToko ?? 'Lokasi Absensi',
                          labelWidget: Text(
                            userArea.nameToko ?? 'Lokasi Absensi',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onSelected: (TokoModel? newValue) {
                        controller.onAreaSelected(newValue!);
                      },
                    )),
                    // const SizedBox(height: 5,),
                    // Text(
                    //   "Schedule",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                    // const SizedBox(height: 3.0),
                    // Text(
                    //   'Senin, 26 Oktober 2025',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                    // const SizedBox(height: 8.0),
                    // Text(
                    //   "Nama Toko",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                    // const SizedBox(height: 3.0),
                    // Text(
                    //   'TOKO SARJANA',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                    // const SizedBox(height: 8.0),
                    // Text(
                    //   "Alamat Toko",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                    // const SizedBox(height: 3.0),
                    // Text(
                    //   'Jalan Merdeka No. 123, Kelurahan Harmoni, Kecamatan Sejahtera, Kota Bahagia, Kode Pos 12345',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                    // const SizedBox(height: 8.0),
                    // Text(
                    //   "No. Telepon Toko",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                    // const SizedBox(height: 3.0),
                    // Text(
                    //   '+628645436807',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16.0,
                    //     color: Colors.black, // Pastikan warna kontras
                    //   ),
                    // ),
                  ],
                ),
              ),
            ]),
          ),
        ]
      ),
    ));
  }
}
