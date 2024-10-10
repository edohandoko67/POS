import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:salesforce/widgets/custom.textfield.dart';

import '../../auth/service/api.constant.dart';

class ProductFragment extends GetView<HomeController> {
  ProductFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF3F8CE2),
      //   title: Text(
      //     'Produk',
      //     style: GoogleFonts.poppins(
      //         fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Get.back();
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          color: Color(0xFFe8e7e7),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 50,
                  child: TextField(
                    controller: controller.search,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Cari',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.filteredProducts.isEmpty) {
                      return const Center(child: Text('No products found'));
                    } else {
                      int crossAxisCount = (screenWidth / 150)
                          .floor(); // Misalnya, 150 adalah lebar item
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount, // Jumlah kolom
                          crossAxisSpacing: 1.0, // Jarak horizontal antar item
                          mainAxisSpacing: 1.0, // Jarak vertikal antar item
                          childAspectRatio: (screenWidth * 0.2) /
                              (screenHeight * 0.1 * 1.3), // Rasio aspek gambar
                        ),
                        itemCount: controller.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final item = controller.filteredProducts[index];
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(
                                          10.0), // Radius untuk sudut atas
                                    ),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  // Memastikan gambar terpotong sesuai radius
                                  child: Container(
                                      width: screenWidth * 0.4,
                                      height: screenHeight * 0.2,
                                      child: Image.asset(item['image'] ?? '')),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: Colors.white, // Warna latar belakang
                                      borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(
                                            7.0), // Radius untuk sudut bawah
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['name'] ?? 'No product name',
                                            style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            item['harga'] ?? 'No Price',
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },

                        // child: ListView.builder(
                        //   itemCount: controller.filteredProducts.length,
                        //   itemBuilder: (context, index) {
                        //     final item = controller.filteredProducts[index];
                        //     return ListTile(
                        //       leading: SizedBox(
                        //           width: 50,
                        //           child: Image.asset(item['image'] ?? 'assets/default_image.png')),
                        //       title: Text(item['name'] ?? 'No Name'),
                        //       subtitle: Text(item['harga'] ?? 'No Price'),
                        //     );
                        //   },
                        // ),
                      );
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
