import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

class UpdateToko extends GetView<SalesController> {
 UpdateToko({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text('Update Toko', style: GoogleFonts.poppins(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Form Update', style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                ),),
                const SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kode',
                    hintText: 'T074GHG',
                  ),
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Toko',
                    hintText: 'Nama Toko Satu'
                  ),
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Alamat',
                      hintText: 'Jl. Merdeka No. 10 RT 01 RW 02'
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Provinsi',
                            hintText: 'Jawa Timur'
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Kab/Kota',
                            hintText: 'Kota Mojokerto'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Kecamatan',
                            hintText: 'Mojoanyar'
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Desa',
                            hintText: 'Gebangmalang'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Alamat Pengiriman',
                      hintText: 'Alamat Pengiriman'
                  ),
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Alamat Lain',
                      hintText: 'Alamat Lain'
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.45,
                      height: 65,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Tipe Outlet'),
                        onChanged: (newValue) {},
                        items: [],
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.45,
                      height: 65, // Sesuaikan tinggi container agar cukup untuk tombol dan teks
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Upload', overflow: TextOverflow.ellipsis,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                  minimumSize: const Size(40, 30), // Ukuran minimal tombol
                                  // maximumSize: Size(50, 30), // Ukuran maksimal tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: () {},
                              child: Text(
                                'Pilih', style: GoogleFonts.poppins(
                                color: Colors.white
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama Pemilik',
                      hintText: 'BASUKI'
                  ),
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No. KTP',
                      hintText: '147258369887554441'
                  ),
                ),
                const SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  height: 65, // Sesuaikan tinggi container agar cukup untuk tombol dan teks
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7.0, right: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Upload KTP', overflow: TextOverflow.ellipsis,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              minimumSize: const Size(40, 30), // Ukuran minimal tombol
                              // maximumSize: Size(50, 30), // Ukuran maksimal tombol
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed: () {},
                          child: Text(
                            'Pilih', style: GoogleFonts.poppins(
                              color: Colors.white
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No. HP',
                      hintText: ''
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.45,
                      height: 65,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Status Pajak'),
                        onChanged: (newValue) {},
                        items: [],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'No. NPWP',
                            hintText: ''
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama NPWP',
                      hintText: ''
                  ),
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama Pengiriman',
                      hintText: ''
                  ),
                ),
                const SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Catatan',
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.45,
                      height: 65,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('TOP'),
                        onChanged: (newValue) {},
                        items: [],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Limit Kredit',
                            hintText: ''
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.45,
                      height: 65,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Grup Discount'),
                        onChanged: (newValue) {},
                        items: [],
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.45,
                      height: 65,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: DropdownButtonFormField<int>(
                        hint: const Text('Week / Minggu'),
                        onChanged: (newValue) {},
                        items: [],
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
                const SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  height: 65,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: DropdownButtonFormField<String>(
                    hint: const Text('Hari Kunjungan'),
                    onChanged: (newValue) {},
                    items: [],
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF189EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    minimumSize: const Size(100, 35)
                  ),
                    onPressed: () {},
                    child: Text('SIMPAN',
                      style: GoogleFonts.poppins(
                          color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
