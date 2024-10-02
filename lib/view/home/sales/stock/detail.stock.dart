import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/auth/model/stock.product.dart';
import 'package:salesforce/auth/service/api.constant.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';
import 'package:salesforce/view/login/login.controller.dart';

import '../../../../routes/pages.dart';

class DetailStock extends GetView<SalesController> {
  DetailStock({super.key});

  int? price;
  StockProduct stockProduct = Get.arguments;

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        // title: Text('Stock', style: GoogleFonts.poppins(
        //     fontSize: 14,
        //     fontWeight: FontWeight.w700,
        //     color: Colors.white
        // ),),
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
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white38,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                Get.toNamed(Routes.CART);
              },
              icon: const Icon(Icons.add_shopping_cart, color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0), // Radius untuk sudut atas
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      (ApiConstant.baseUrl +
                          stockProduct.imageProduct.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rp ${stockProduct.price.toString()}",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Sisa stok : ${stockProduct.jumlahStock.toString()}",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Text(
                  stockProduct.productName ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.normal),
                ),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showBottomSheetChart(context, stockProduct.idProduct ?? 0);
                      print("id detail stock : ${stockProduct.idProduct}");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: const Icon(
                      Icons.shopping_basket,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFF3F8CE2),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: Text(
                      'Tambah Stock',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void showBottomSheetChart(BuildContext context, int id) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            width: double.infinity,
            height: 500,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      final selectedProduct =
                          controller.selectedProduct.value;

                      if (selectedProduct == null) {
                        return SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              ApiConstant.baseUrl +
                                  stockProduct.imageProduct.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            Image.network(
                              ApiConstant.baseUrl +
                                  selectedProduct.imageDetail.toString(),
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        );
                      }
                    }),
                    Text("Rp ${stockProduct.price}", style: GoogleFonts.poppins(
                        color: Colors.deepOrange
                    ),),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.white, // Warna latar belakang tombol
                              // onPrimary: Colors.black, // Warna teks tombol
                              minimumSize: const Size(20, 20), // Ukuran minimum tombol
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0), // Radius sudut tombol
                              ),
                            ),
                            onPressed: () {
                              controller.decrement();
                            }, child: const Text("-", style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 5,),
                        Obx(() => Text("${controller.count}", style: const TextStyle(fontSize: 15, color: Color(0xFF3F8CE2)))),
                        const SizedBox(width: 5,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.white, // Warna latar belakang tombol
                              // onPrimary: Colors.black, // Warna teks tombol
                              minimumSize: const Size(20, 20), // Ukuran minimum tombol
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0), // Radius sudut tombol
                              ),
                            ),
                            onPressed: () {
                              controller.increment();
                            }, child: const Text("+", style: TextStyle(color: Colors.black))),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text("Varian",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                    ),),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Obx(
                        () => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: controller.listDetailStock.length,
                          itemBuilder: (context, index) {
                            final product = controller.listDetailStock[index];
                            return GestureDetector(
                              onTap: () {
                                controller.selectProduct(product);
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black, // Warna border
                                          width: 1, // Lebar border
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          ApiConstant.baseUrl +
                                              product.imageDetail.toString(),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(product.nameVarian ?? '', style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15
                                  ),),
                                  Text("Stock : ")
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Obx(() => Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      controller.selectedProduct.value != null
                                          ? const Color(0xFF3F8CE2)
                                          : Colors.grey),
                              onPressed: () {
                                controller.addToCart();
                                //print('Login: ${controller.userId.value.idUser ?? 0}');
                              },
                              child: Text(
                                "Tambah Keranjang",
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                        )
                      ],
                    )),
              )
            ]),
          );
        });
  }
}
