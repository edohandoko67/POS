import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';
import 'package:signature/signature.dart';

class NotOrder extends GetView<SalesController> {
  NotOrder({super.key});

  final SignatureController _controller = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text(
          'Not Order',
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Image.asset('assets/images/toko_jaya.png'),
                  title: Text('TOKO SUKSES JAYA 1'),
                  subtitle: Text(
                    'Jl. Pahlawan No. 10, Mojopurno, Kecamatan Magersari, Kota Mojokerto, Jawa Timur',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                const Divider(color: Colors.black,),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: controller.date,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                      suffixIcon: Icon(Icons.calendar_month)),
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  onTap: () async {
                    DateTime currentDate = DateTime.now();
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: currentDate,
                      lastDate: DateTime(2100),
                      locale: const Locale("id"),
                    );
                    if (pickedDate != null) {
                      String formattedDateShow =
                          DateFormat('EEEE, dd MMMM yyyy', 'id')
                              .format(pickedDate);
                      String formattedDateApi =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(pickedDate);
                      // controller.dateAddApi = formattedDateApi;
                      controller.date.text = formattedDateShow;
                    }
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Isi Keterangan'),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tanda Tangan'),
                    IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: Icon(Icons.delete, color: Color(0xFF869C00),))
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Signature(
                    controller: _controller,
                    width: double.infinity,
                    height: 200,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3F8CE2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      onPressed: () {},
                      child: Text(
                        'Simpan',
                        style: GoogleFonts.poppins(color: Colors.white),
                      )),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
