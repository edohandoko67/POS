import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';
import 'package:signature/signature.dart';

class SalesOrder extends GetView<SalesController> {
  SalesOrder({super.key});

  List<Map<String, dynamic>> listProduct = [
    {
      'no': '1',
      'product': 'Kapal Api',
      'qty': '20.000 x 2',
      'disc': '0%',
      'total': 'Rp 40.000,-'
    },
    {
      'no': '2',
      'product': 'Gula Pasir',
      'qty': '15.000 x 2',
      'disc': '0%',
      'total': 'Rp 30.000,-'
    },
    {
      'no': '3',
      'product': 'Permen',
      'qty': '7.000',
      'disc': '0%',
      'total': 'Rp 7.000,-'
    },
  ];

  final SignatureController _controller =
      SignatureController(penColor: Colors.black, penStrokeWidth: 5);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text(
          'Sales Order',
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
          scrollDirection: Axis.vertical,
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
                  child: TextField(
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
                    style: TextStyle(fontSize: 16),
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
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
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
                                            'Tambah Produk Order',
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
                                            decoration: InputDecoration(
                                              labelText: 'Produk*',
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
                                            SizedBox(
                                              width: screenWidth * 0.45,
                                              height: 50,
                                              child:
                                                  DropdownButtonFormField<int>(
                                                hint: const Text(
                                                    'Satuan Produk*'),
                                                //value: controller.idSatuanKuantitas,
                                                onChanged: (newValue) {
                                                  // controller.idSatuanKuantitas = newValue;
                                                },
                                                items: [],
                                                decoration: InputDecoration(
                                                  //contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                                                  isDense: true,
                                                  // Reduces the vertical size of the dropdown
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                ),
                                              ),
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
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
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
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
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
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
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
                                            decoration: InputDecoration(
                                              labelText: 'Keterangan Discount*',
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
                                                          Color(0xFF3F8CE2),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5))),
                                                  onPressed: () {},
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
                    const Text('List Order')
                  ],
                ),
                DataTable(
                    columnSpacing: 50,
                    columns: [
                      DataColumn(
                        label: Text(
                          'No',
                          style: GoogleFonts.poppins(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                            width: 60,
                            child: Text(
                              'Product\nItem',
                              style: GoogleFonts.poppins(
                                  fontSize: 11, fontWeight: FontWeight.w700),
                            )),
                      ),
                      DataColumn(
                        label: Text(
                          'Sub\nTotal',
                          style: GoogleFonts.poppins(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Act',
                          style: GoogleFonts.poppins(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                    rows: List.generate(
                      listProduct.length,
                      (index) {
                        final item = listProduct[index];
                        return DataRow(cells: [
                          DataCell(Text(item['no'])),
                          DataCell(
                            SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['product'],
                                    style: GoogleFonts.poppins(fontSize: 10),
                                  ),
                                  Text(
                                    item['qty'],
                                    style: GoogleFonts.poppins(fontSize: 9),
                                  ),
                                  Text(
                                    item['disc'],
                                    style: GoogleFonts.poppins(fontSize: 9),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(SizedBox(
                              width: 60,
                              child: Text(
                                item['total'],
                                style: GoogleFonts.poppins(fontSize: 9),
                              ))),
                          DataCell(IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          )),
                        ]);
                      },
                    )),
                DataTable(columnSpacing: 42, columns: [
                  DataColumn(
                    label: Text(
                      'Grand Total',
                      style: GoogleFonts.poppins(
                          fontSize: 11, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text(
                      'Rp 600.000,-',
                      style: GoogleFonts.poppins(
                          fontSize: 9, fontWeight: FontWeight.w700),
                    ),
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
                  ])
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.45,
                      height: 50,
                      child: DropdownButtonFormField<int>(
                        hint: const Text('CASH'),
                        //value: controller.idSatuanKuantitas,
                        onChanged: (newValue) {
                          // controller.idSatuanKuantitas = newValue;
                        },
                        items: [],
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                          isDense: true,
                          // Reduces the vertical size of the dropdown
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.45,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Limit Kredit*',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tanda Tangan'),
                    IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xFF869C00),
                        ))
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
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3F8CE2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    return AnimatedSwitcher(
                                      duration: const Duration(seconds: 1),
                                      child: controller.checklist.value
                                          ? Icon(
                                        Icons.check_circle,
                                        key: ValueKey('success'),
                                        color: Colors.green,
                                        size: 100,
                                      )
                                          : Container(
                                        key: const ValueKey('empty'),
                                        width: 100,
                                        height: 100,
                                        color: Colors.transparent,
                                      ),
                                      transitionBuilder: (Widget child, Animation<double> animation) {
                                        const curve = Curves.easeInOut;
                                        final offsetAnimation = Tween<Offset>(
                                          begin: const Offset(0, 1),
                                          end: Offset.zero,
                                        ).animate(CurvedAnimation(parent: animation, curve: curve));

                                        return SlideTransition(position: offsetAnimation, child: child);
                                      },
                                    );
                                  }),
                                  const SizedBox(height: 20),
                                  const Text('Sales Order Telah Berhasil!'),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF3C65F6),
                                          minimumSize: const Size(100, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Oke, Cetak Bukti',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ).whenComplete(() {
                          controller.checklist.value = true; // Trigger animation after the modal is shown
                        });
                      },
                    child: Text('Proses', style: GoogleFonts.poppins(color: Colors.white),),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
