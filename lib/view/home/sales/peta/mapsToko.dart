import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/remote/api/api_endpoints.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:flutter/material.dart';

// import '../../../../auth/service/api.constant.dart';
import '../../../../routes/pages.dart';

class MapsToko extends GetView<HomeController> {
  const MapsToko({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.listToko.isEmpty) {
            return Center(
              child: Text(
                'No items in the cart',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.listToko.length,
              itemBuilder: (context, index) {
                final item = controller.listToko[index];
                return ListTile(
                  leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        (ApiEndPoints.baseUrl + item.image.toString()),
                        fit: BoxFit.cover,
                      )),
                  title: Text(
                    item.nameToko ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle:
                  Text(
                    '${item.address ?? ''} ${item.kota ?? ''} ${item.provinsi ?? ''}', maxLines: 2,
                    // Batasi jumlah baris maksimum
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.DETAILMAPSTOKO);

                  },
                );
              },
            );
          }
        }),
      ),
    );
  }
}
