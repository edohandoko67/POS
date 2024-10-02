import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:salesforce/auth/model/stock.product.dart';
import 'package:salesforce/auth/service/api.constant.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';
import 'package:salesforce/widgets/date.dart';

import '../../../../auth/model/tracking.dart';

class Pengiriman extends GetView<SalesController> {
  Pengiriman({super.key});

  final List<Map<String, String>> events = [
    {'date': '29/09/2024 14.14', 'description': 'Sekretaris menerima Agenda tersebut', 'isFirst': 'true', 'isLast': 'false'},
    {'date': '29/09/2024 09.11', 'description': 'Agenda tersampaikan kepada Sekretaris', 'isFirst': 'false', 'isLast': 'false'},
    {'date': '29/09/2024 09.11', 'description': 'Kepala Badan BKPSDM Pamekasan disposisi Agenda ke Sekretaris', 'isFirst': 'false', 'isLast': 'false'},
    {'date': '29/09/2024 09.11', 'description': 'Agenda tersampaikan kepada Kepala BKPSDM Pamekasan', 'isFirst': 'false', 'isLast': 'false'},
    {'date': '28/09/2024 13.26', 'description': 'Surat masuk dan agenda berhasil ditambahkan', 'isFirst': 'false', 'isLast': 'true'},
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    String formattedDate = controller.trackingBarang.value.date != null
        ? Tracking.dateFormat.format(controller.trackingBarang.value.date!)
        : 'No Date';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F8CE2),
        title: Text("Pengiriman Barang", style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white
        ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cek Resi", style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),),
              // const SizedBox(height: 10,),
              // Text("Kurir", style: GoogleFonts.poppins(
              //   fontWeight: FontWeight.w500,
              //   fontSize: 14
              // ),),
              // Container(
              //   height: 50,
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.grey),
              //       borderRadius: BorderRadius.circular(5.0)
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 8.0), //horizontal
              //     child: DropdownButtonFormField(
              //         // hint: const Text("Kurir"),
              //         value: controller.idSalesController,
              //         items: controller.listKurir
              //             .map<DropdownMenuItem<int>>((item) {
              //           return DropdownMenuItem<int>(
              //               value: item.idSales,
              //               child: Text(item.name ?? ""));
              //         }).toList(),
              //         onChanged: (newValue) {
              //           controller.idSalesController = newValue;
              //         }),
              //   ),
              // ),
              const SizedBox(height: 7,),
              Text("No Resi", style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 3,),
              TextField(
                controller: controller.TextNoResi,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: ""
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F8CE2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
                  onPressed: () {
                    controller.trackingKurir();
                  },
                  child: Text("Cek Resi",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),)),
              const SizedBox(height: 10,),
              Expanded(
                child: Obx(() {
                  // Control the visibility based on isTrackingVisible
                  if (controller.isTrackingVisibility.value) {
                    return ListView.builder(
                      itemCount: controller.trackingProduct.length,
                      itemBuilder: (context, index) {
                        final event = controller.trackingProduct[index];
                        String formattedDate = event.date != null
                            ? Tracking.dateFormat.format(event.date!)
                            : 'No Date';
                        return Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: Text(formattedDate, style: GoogleFonts.poppins(fontSize: 13),)),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                if (!event.checkData!) VerticalDivider(color: Colors.grey, thickness: 2),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: event.checkData! ? Colors.green : Colors.grey,
                                  ),
                                ),
                                if (!event.checkDataAfter!) VerticalDivider(color: Colors.grey, thickness: 2),
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  width: screenWidth * 0.6,
                                  child: Text(event.status ?? '')),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No tracking data available.'));
                  }
                }),
              ),

              // Expanded(
              //   child: ListView.builder(
              //       itemCount: events.length,
              //       itemBuilder: (context, index) {
              //         final event = events[index];
              //         return TimelineTile(
              //           date: event['date']!,
              //           description: event['description']!,
              //           isFirst: event['isFirst'] == 'true',
              //           isLast: event['isLast'] == 'true',
              //         );
              //       }),
              // )
        ]),
      ),
    ));
  }
}

//
class TimelineTile extends StatelessWidget {
  final String? date;
  final String? description;
  final bool? isFirst;
  final bool? isLast;

  TimelineTile({
    this.date,
    this.description,
    this.isFirst,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
      child: Row(
        children: [
          Text(date.toString()),
          SizedBox(width: 10),
          Column(
            children: [
              if (!isFirst!) VerticalDivider(color: Colors.grey, thickness: 2),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFirst! ? Colors.red : Colors.grey,
                ),
              ),
              if (!isLast!) VerticalDivider(color: Colors.grey, thickness: 2),
            ],
          ),
          SizedBox(width: 15),
          Expanded(child: Text(description ?? '')),
          // Expanded(
          //   child: ListTile(
          //     title: Text(date),
          //     subtitle: Text(description),
          //   ),
          // ),
        ],
      ),
    );
  }
}
