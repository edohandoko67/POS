import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';
import 'package:signature/signature.dart';

import '../../../routes/pages.dart';

class ReturOrder extends GetView<SalesController> {
  ReturOrder({super.key});

  List<Map<String, dynamic>> listProduct = [
    {
      'no': '1',
      'product': 'Kapal Api',
      'total': '40.000',
      'alasan': 'Segel rusak',
    },
    {
      'no': '2',
      'product': 'Gula Pasir',
      'total': '30.000',
      'alasan': 'Barang sudah exp'
    },
  ];

  final SignatureController _controller = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 5
  );


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text('Retur', style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white
        ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Get.offAndToNamed(Routes.HOME);
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
                ListTile(
                  leading: Image.asset('assets/images/toko_jaya.png'),
                  title: const Text('TOKO SUKSES JAYA 1'),
                  subtitle: const Text(
                    'Jl. Pahlawan No. 10, Mojopurno, Kecamatan Magersari, Kota Mojokerto, Jawa Timur',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(color: Colors.black,),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'No. SO*',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: controller.date,
                    readOnly: true,
                    keyboardType: TextInputType.none,
                    decoration: const InputDecoration(
                      labelText: '',
                      suffixIcon: Icon(Icons.calendar_month),
                      contentPadding: EdgeInsets.all(16),
                    ),
                    style: const TextStyle(fontSize: 16),
                    onTap: () async {
                      DateTime currentDate = DateTime.now();
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: currentDate,
                          lastDate: DateTime(2100),
                          locale: const Locale('id'));
                      if (pickedDate != null) {
                        String formattedDateShow =
                        DateFormat('EEEE, dd MMMM yyyy', 'id')
                            .format(pickedDate);
                        controller.date.text = formattedDateShow;
                        print(pickedDate);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3F8CE2),
                            minimumSize: Size(40, 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 25.0),
                                          child: Text(
                                            'Tambah Produk Retur',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 2),
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          child: TextField(
                                            controller: controller.nameProduct,
                                            decoration: const InputDecoration(
                                              hintText: 'Product*',
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.all(16),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            // SizedBox(
                                            //   width: screenWidth * 0.45,
                                            //   height: 50,
                                            //   child:
                                            //   DropdownButtonFormField<int>(
                                            //     hint: const Text(
                                            //         'Satuan Produk*'),
                                            //     value: controller.idSatuanProduct,
                                            //     onChanged: (newValue) {
                                            //       controller.idSatuanProduct = newValue;
                                            //     },
                                            //     items: controller.listSatuanProduct.map<DropdownMenuItem<int>>((item) {
                                            //         return DropdownMenuItem<int>(
                                            //         value: item.id_satuan,
                                            //         child: Text(item.satuan_product.toString()),
                                            //         );
                                            //         }).toList(),
                                            //     decoration: InputDecoration(
                                            //       //contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                                            //       isDense: true,
                                            //       // Reduces the vertical size of the dropdown
                                            //       enabledBorder:
                                            //       OutlineInputBorder(
                                            //         borderSide: const BorderSide(
                                            //             color: Colors.grey),
                                            //         borderRadius:
                                            //         BorderRadius.circular(
                                            //             5.0),
                                            //       ),
                                            //       focusedBorder:
                                            //       OutlineInputBorder(
                                            //         borderSide: const BorderSide(
                                            //             color: Colors.blue),
                                            //         borderRadius:
                                            //         BorderRadius.circular(
                                            //             5.0),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            Container(
                                              width: screenWidth * 0.45,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              child: TextField(
                                                controller: controller.priceProduct,
                                                keyboardType:
                                                TextInputType.number,
                                                decoration: const InputDecoration(
                                                  hintText: 'Harga Retail*',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                  EdgeInsets.all(10),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: screenWidth * 0.45,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              child: TextField(
                                                controller: controller.quantityProduct,
                                                keyboardType:
                                                TextInputType.number,
                                                decoration: const InputDecoration(
                                                  hintText: 'QTY Produk*',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                  EdgeInsets.all(10),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              width: screenWidth * 0.45,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              child: TextField(
                                                controller: controller.discountProduct,
                                                keyboardType:
                                                TextInputType.number,
                                                decoration: const InputDecoration(
                                                  hintText: 'Discount(%)*',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                  EdgeInsets.all(10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 2),
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          child: TextField(
                                            controller: controller.alasanProduct,
                                            decoration: const InputDecoration(
                                              hintText: 'Alasan Retur*',
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.all(16),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.45,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      const Color(0xFF3F8CE2),
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              5))),
                                                  onPressed: () {
                                                  //  controller.createProductReturn();
                                                  },
                                                  child: Text(
                                                    'TAMBAHKAN',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.45,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      Colors.grey,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              5))),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'KEMBALI',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                    const Text('List Retur')
                  ],
                ),
                const SizedBox(height: 5,),
                // DataTable(
                //     columnSpacing: 40,
                //     columns: [
                //       DataColumn(label: Text('No', style: GoogleFonts.poppins(
                //           fontSize: 10, fontWeight: FontWeight.w700),)),
                //       DataColumn(label: Text('Produk\nRetur', style: GoogleFonts.poppins(
                //           fontSize: 10, fontWeight: FontWeight.w700),)),
                //       DataColumn(label: Text('Sub\nTotal', style: GoogleFonts.poppins(
                //           fontSize: 10, fontWeight: FontWeight.w700),)),
                //       DataColumn(label: Text('Alasan', style: GoogleFonts.poppins(
                //           fontSize: 10, fontWeight: FontWeight.w700),)),
                //       DataColumn(label: Text('Act', style: GoogleFonts.poppins(
                //           fontSize: 10, fontWeight: FontWeight.w700),)),
                //     ] , rows: List.generate(
                //     controller.listBarang.length, (index) {
                //       final item = controller.listBarang[index];
                //       print(item.name);
                //       return DataRow(cells: [
                //         DataCell(Text(item.id.toString(), style: GoogleFonts.poppins(fontSize: 10),)),
                //         DataCell(Text(item.name ?? '', style: GoogleFonts.poppins(fontSize: 10),)),
                //         DataCell(Text(
                //           (item.price ?? 0.0).toStringAsFixed(2), // Mengonversi double ke string dengan 2 tempat desimal
                //           style: GoogleFonts.poppins(fontSize: 10),
                //         ),),
                //         DataCell(InkWell(
                //           onTap: () {
                //             showModalBottomSheet(
                //                 context: context, builder: (BuildContext context) {
                //                   return SizedBox(
                //                     width: double.infinity,
                //                     height: 200,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.center,
                //                       children: [
                //                         Text(item.alasan ?? '', style: GoogleFonts.poppins(fontSize: 14)),
                //                         const SizedBox(height: 25,),
                //                         ElevatedButton(
                //                           style: ElevatedButton.styleFrom(
                //                             backgroundColor: Colors.grey,
                //                             shape: RoundedRectangleBorder(
                //                               borderRadius: BorderRadius.circular(5)
                //                             )
                //                           ),
                //                             onPressed: () {
                //                               Get.back();
                //                             },
                //                             child: Text('TUTUP', style: GoogleFonts.poppins(color: Colors.white),))
                //                       ],
                //                     ),
                //                   );
                //             });
                //           },
                //           child: Text('Lihat', style: GoogleFonts.poppins(fontSize: 10, color: Colors.blueAccent)),
                //           ),
                //         ),
                //         DataCell(IconButton(
                //           onPressed: () {
                //             Get.defaultDialog(
                //               barrierDismissible: true,
                //               title: 'Konfirmasi Hapus',
                //               content: const Padding(
                //                 padding: EdgeInsets.all(10.0),
                //                 child: Text('Apakah Anda yakin ingin menghapus data ini?'),
                //               ),
                //               confirm: TextButton(
                //                 onPressed: () {
                //                   controller.deleteProductReturn(item.id ?? 0);
                //                   controller.listBarang;
                //                 },
                //                 child: Text('Hapus', style: GoogleFonts.poppins(
                //                   color: Colors.black
                //                 ),),
                //               ),
                //               cancel: TextButton(
                //                 onPressed: () {
                //                   Get.back();
                //                 },
                //                 child: Text('Batal', style: GoogleFonts.poppins(
                //                   color: Colors.red
                //                 ),),
                //               ),
                //             );
                //           },
                //           icon: const Icon(Icons.delete),
                //         )),
                //       ]);
                // })),
                DataTable(columnSpacing: 30, columns: [
                  DataColumn(
                    label: Text(
                      'Grand Total',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text(
                      '${controller.total.value}',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const DataColumn(
                    label: Text(''),
                  ),
                  const DataColumn(
                    label: Text(''),
                  ),
                  const DataColumn(
                    label: Text(''),
                  ),
                  const DataColumn(
                    label: Text(''),
                  ),
                ], rows: const [
                  DataRow(cells: [
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                  ])
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tanda Tangan'),
                    IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Signature(
                    controller: _controller,
                    width: double.infinity,
                    height: 200,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 50,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F8CE2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                      onPressed: () {},
                      child: Text('Proses', style: GoogleFonts.poppins(color: Colors.white),)),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  //parse double
  String _formatPrice(double? price) {
    // Menggunakan NumberFormat untuk format harga (opsional)
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    return formatter.format(price ?? 0.0);
  }
}
