import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

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
              const SizedBox(height: 7,),
              Text("No Resi", style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 3,),
              TextField(
                controller: controller.TextNoResi,
                decoration: const InputDecoration(
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
                                if (!event.checkData!) const VerticalDivider(color: Colors.grey, thickness: 2),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: event.checkData! ? Colors.green : Colors.grey,
                                  ),
                                ),
                                if (!event.checkDataAfter!) const VerticalDivider(color: Colors.grey, thickness: 2),
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
                    return const Center(child: Text('No tracking data available.'));
                  }
                }),
              ),

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
          const SizedBox(width: 10),
          Column(
            children: [
              if (!isFirst!) const VerticalDivider(color: Colors.grey, thickness: 2),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFirst! ? Colors.red : Colors.grey,
                ),
              ),
              if (!isLast!) const VerticalDivider(color: Colors.grey, thickness: 2),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(child: Text(description ?? '')),
        ],
      ),
    );
  }
}
