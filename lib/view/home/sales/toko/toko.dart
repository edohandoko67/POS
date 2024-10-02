import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/routes/pages.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../auth/service/api.constant.dart';

class Toko extends GetView<HomeController> {
  const Toko({super.key});

  Widget shimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 0.5
          ),
          itemCount: controller.listToko.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0)
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return shimmerLoading();
            }
            else if (controller.listToko.isEmpty) {
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
                shrinkWrap: true,
                itemCount: controller.listToko.length,
                itemBuilder: (context, index) {
                  final item = controller.listToko[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAILTOKOBYID, arguments: item);
                    },
                    child: ListTile(
                      leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            (ApiConstant.baseUrl + item.image.toString()),
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
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
