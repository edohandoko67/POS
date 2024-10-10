import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

class Piutang extends GetView<SalesController> {
  Piutang({super.key});

  List<Map<String, dynamic>> listProduct = [
    {
      'no': '1',
      'invoice': 'INV-20240624-003',
      'nominal': '10.000.000,-',
      'terbayar': '7.000.000,-',
      'utang': '3.000.000,-'
    },
    {
      'no': '2',
      'invoice': 'INV-20240624-001',
      'nominal': '10.000.000,-',
      'terbayar': '10.000.000,-',
      'utang': '0,-'
    },
  ];

  List<Map<String, dynamic>> listRiwayat = [
    {
      'no': '1',
      'tanggal': '24-06-2024',
      'transaksi': 'XY1234567890',
      'dibayar': '7.000.000,-',
      'utang': '3.000.000,-'
    },
    {
      'no': '2',
      'tanggal': '22-06-2024',
      'transaksi': 'XY1234567880',
      'dibayar': '5.000.000,-',
      'utang': '2.000.000,-'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text('Piutang', style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 14,
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
                Text('Data Piutang', style: GoogleFonts.poppins(),),
                DataTable(
                  columnSpacing: 5,
                    columns: [
                      DataColumn(label: Text('No', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('No. Invoice', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('Nominal', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('Terbayar', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('Belum\nTerbayar', style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),)),
                    ],
                    rows: List.generate(listProduct.length, (index) {
                      final item = listProduct[index];
                  return DataRow(cells: [
                    DataCell(Text(item['no'], style: GoogleFonts.poppins(fontSize: 10),)),
                    DataCell(Text(item['invoice'], style: GoogleFonts.poppins(fontSize: 10, color: Colors.blueAccent),)),
                    DataCell(Text(item['nominal'], style: GoogleFonts.poppins(fontSize: 10),)),
                    DataCell(Text(item['terbayar'], style: GoogleFonts.poppins(fontSize: 10),)),
                    DataCell(Text(item['utang'], style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),)),
                  ]);
                })),
                DataTable(columnSpacing: 25, columns: [
                  const DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text(
                      'Total Piutang',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  DataColumn(
                    label: Text('',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700),),
                  ),
                  DataColumn(
                    label: Text('',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700),),
                  ),
                  DataColumn(
                    label: Text('',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700),),
                  ),
                  DataColumn(
                    label: Text('3.000.000,-',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w700, color: Colors.red),),
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
                const Text('Riwayat Transaksi Bayar'),
                DataTable(
                    columnSpacing: 10,
                    columns: [
                      DataColumn(label: Text('No', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('Tanggal', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('No.\nTransaksi', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('Dibayar', style: GoogleFonts.poppins(fontSize: 10),)),
                      DataColumn(label: Text('Belum\nTerbayar', style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),)),
                    ],
                    rows: List.generate(listRiwayat.length, (index) {
                      final item = listRiwayat[index];
                      return DataRow(cells: [
                        DataCell(Text(item['no'], style: GoogleFonts.poppins(fontSize: 10),)),
                        DataCell(Text(item['tanggal'], style: GoogleFonts.poppins(fontSize: 10),)),
                        DataCell(Text(item['transaksi'], style: GoogleFonts.poppins(fontSize: 10, color: Colors.blueAccent),)),
                        DataCell(Text(item['dibayar'], style: GoogleFonts.poppins(fontSize: 10),)),
                        DataCell(Text(item['utang'], style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),)),
                      ]);
                    })),
                const SizedBox(height: 30,),
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
                      child: Text('Transaksi Pembayaran', style: GoogleFonts.poppins(color: Colors.white),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
