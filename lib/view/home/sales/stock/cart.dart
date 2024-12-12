import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/remote/api/api_endpoints.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

class Cart extends GetView<SalesController> {
  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    // Call the method only once when the widget is initialized
    controller.listCartById();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text(
          "Keranjang Saya",
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.cartList.isEmpty) {
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
              itemCount: controller.cartList.length,
              itemBuilder: (context, index) {
                final item = controller.cartList[index];
                return Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: Image.network(
                      ApiEndPoints.baseUrl + item.image.toString(),
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "${item.nameProduct}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      'Jumlah : ${item.jumlahStock}',
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: Text(
                      "Rp${item.total?.toStringAsFixed(2)}",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF3F8CE2),
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}

