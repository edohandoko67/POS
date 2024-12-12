import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/remote/api/api_endpoints.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../routes/pages.dart';
import '../controller/sales.controller.dart';

class StockProduct extends GetView<SalesController> {
  StockProduct({super.key});

  Widget shimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom sementara
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          childAspectRatio: 0.5, // Rasio aspek untuk item
        ),
        itemCount: controller.filteredStockProducts.length, // Jumlah item shimmer
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text('Stock', style: GoogleFonts.poppins(
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
        child: Container(
          color: const Color(0xFFe8e7e7),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    controller: controller.searchProduct,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Cari',
                      suffix: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      controller.searchProducts(query);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 3,),
              Expanded(
                child: Obx(() {
                  if (controller.filteredStockProducts.isEmpty) {
                    return const Center(child: Text('No product found!'),);
                  } else if (controller.isLoading.value) {
                    return shimmerLoading();
                  } else {
                    int crossAxisCount = (screenWidth / 150).floor(); // Misalnya, 150 adalah lebar item
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount, // Jumlah kolom
                        crossAxisSpacing: 1.0, // Jarak horizontal antar item
                        mainAxisSpacing: 1.0, // Jarak vertikal antar item
                        childAspectRatio: (screenWidth * 0.2) / (screenHeight * 0.1 * 1.2), // Rasio aspek gambar
                      ),
                      itemCount: controller.filteredStockProducts.length,
                      itemBuilder: (context, index) {
                        final item = controller.filteredStockProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_STOCK, arguments: item);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              children: [
                                // Gambar dengan border radius di bagian atas
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10.0), // Radius untuk sudut atas
                                    ),
                                  ),
                                  clipBehavior: Clip.hardEdge, // Memastikan gambar terpotong sesuai radius
                                  child: SizedBox(
                                    width: screenWidth * 0.4,
                                    height: screenHeight * 0.16,
                                    child: Image.network(
                                      (ApiEndPoints.baseUrl + item.imageProduct.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Konten bawah dengan border radius di bagian bawah
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: double.infinity,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: Colors.white, // Warna latar belakang
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(7.0), // Radius untuk sudut bawah
                                      ),
                                      // border: Border.all(
                                      //   width: 2.0,
                                      //   color: Colors.grey,
                                      // ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.productName ?? '',
                                            style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Stock: ${item.jumlahStock}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            item.price.toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                })
              )
            ],
          ),
        ),
      ),
    );
  }
}
