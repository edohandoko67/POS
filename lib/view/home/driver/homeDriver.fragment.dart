import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/driver/controller/home.driver.controller.dart';

import '../../../auth/service/api.constant.dart';

class HomeDriverFragment extends GetView<HomeDriverController> {
  const HomeDriverFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: controller.checklist.value
                    ? const AssetImage('assets/images/bg_driver.png')
                    : const AssetImage('assets/images/bg_sleep.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, top: 19.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hai, ',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: controller.storage.getName(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.message,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Image.asset('assets/icons/garis.png'),
                  const SizedBox(
                    height: 3,
                  ),
                  Text('Point of Sales (POS)',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aplikasi untuk mempermudah transaksi',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      AnimatedSwitcher(duration: Duration(seconds: 1),
                        child: controller.checklist.value
                            ? Icon(
                          Icons.wb_sunny,
                          key: ValueKey('awakeIcon'),
                          size: 30,
                          color: Colors.yellow,
                        )
                            : Icon(
                          Icons.nightlight_round,
                          key: ValueKey('sleepIcon'),
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Image.asset('assets/images/user.png'),
                          title: const Text(
                            'Status Absensi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFFF0943A)),
                          ),
                          subtitle: Obx(() => Text( controller.checklist.value ? 'Sedang bekerja' : 'Sedang istirahat')),
                          trailing: Obx(() {
                            final isChecklist = controller.checklist.value;
                            return SizedBox(
                              width: 110,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isChecklist
                                      ? const Color(0xFF3F8CE2)
                                      : const Color(0xFF0DA337),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    isDismissible: false,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        width: double.infinity,
                                        height: 200,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/icons/choice.png'),
                                            const SizedBox(height: 5),
                                            Text(
                                              isChecklist
                                                  ? 'Anda ingin istirahat?'
                                                  : 'Anda ingin kembali bekerja?',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    minimumSize:
                                                    Size(100, 45),
                                                    backgroundColor:
                                                    const Color(
                                                        0xFF3C65F6),
                                                    shape:
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(5),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    // if (!isChecklist) {
                                                    //   controller.checklist.value = !controller.checklist.value;
                                                    // }
                                                    // Get.back();

                                                    if (controller.checklist.value) {
                                                      controller.checklist.value = false;
                                                    } else {
                                                      controller.checklist.value = true;
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'YA, TENTU',
                                                    style:
                                                    GoogleFonts.poppins(
                                                        color:
                                                        Colors.white),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                ElevatedButton(
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    minimumSize:
                                                    Size(100, 45),
                                                    backgroundColor:
                                                    Colors.grey,
                                                    shape:
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(5),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    print('object');
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'TIDAK',
                                                    style:
                                                    GoogleFonts.poppins(
                                                        color:
                                                        Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  isChecklist ? 'Istirahat' : 'Aktifkan',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white),
                                ),
                              ),
                            );
                          },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 17.0, right: 17.0, top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/jadwal.png'),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Jadwal',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/peta.png'),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Peta',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/toko.png'),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Toko',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/stok.png'),
                                    const SizedBox(height: 4),
                                    // Memberi jarak antara ikon dan teks
                                    const Text(
                                      'Stok',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors
                                              .black), // Sesuaikan gaya teks
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 17.0, right: 17.0, top: 15.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/piutang.png'),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Piutang',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/pengiriman.png'),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Pengiriman',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/laporan.png'),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Laporan',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/sinkron.png'),
                                    const SizedBox(height: 4),
                                    // Memberi jarak antara ikon dan teks
                                    const Text(
                                      'Syncron',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors
                                              .black), // Sesuaikan gaya teks
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    // Ketebalan bayangan di bawah Card
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10), // Sudut Card melengkung
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 10),
                    // Margin luar Card
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Padding dalam Card
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jadwal hari ini',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          // Spasi antara judul dan list
                          SizedBox(
                            height: 200, // Tentukan tinggi ListView.builder
                            child: Obx(() => ListView.builder(
                              itemCount: controller.listToko.length,
                              itemBuilder: (context, index) {
                                final item = controller.listToko[index];
                                return ListTile(
                                  leading: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                        (ApiConstant.baseUrl + item.image.toString()),
                                        fit: BoxFit.cover,
                                      )),
                                  title: Text(
                                    item.nameToko ?? '',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle:
                                  Text(
                                    '${item.address ?? ''} ${item.kota ?? ''} ${item.provinsi ?? ''}', maxLines: 2,
                                    // Batasi jumlah baris maksimum
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: IconButton(
                                    icon: Image.asset('assets/icons/node.png'),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: SingleChildScrollView(
                                              child: Container(
                                                width: 200,
                                                // Sesuaikan dengan lebar yang diinginkan
                                                height: 300,
                                                // Sesuaikan dengan tinggi yang diinginkan
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  // Menyesuaikan tinggi konten dengan isi
                                                  children: [
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            //controller.getImageFromCamera();
                                                          },
                                                          icon: Image.asset(
                                                              'assets/icons/absen_toko.png'),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            //controller.getImageFromCamera();
                                                          },
                                                          child: Text(
                                                            'Absen Toko',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            //Get.toNamed(Routes.DETAILTOKO, arguments: item);
                                                          },
                                                          icon: Image.asset(
                                                              'assets/icons/detail_toko.png'),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            //Get.toNamed(Routes.DETAILTOKO, arguments: item);
                                                          },
                                                          child: Text(
                                                            'Detail Toko',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            // Get.toNamed(Routes
                                                            //     .SALESORDER);
                                                          },
                                                          icon: Image.asset(
                                                              'assets/icons/sales_order.png'),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            // Get.toNamed(Routes
                                                            //     .SALESORDER);
                                                          },
                                                          child: Text(
                                                            'Sales Order',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            // Get.toNamed(Routes
                                                            //     .NOTORDER);
                                                          },
                                                          icon: Image.asset(
                                                              'assets/icons/not_order.png'),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            // Get.toNamed(Routes
                                                            //     .NOTORDER);
                                                          },
                                                          child: Text(
                                                            'Not Order',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            // Get.toNamed(
                                                            //     Routes.RETUR);
                                                          },
                                                          icon: Image.asset(
                                                              'assets/icons/return.png'),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            // Get.toNamed(
                                                            //     Routes.RETUR);
                                                          },
                                                          child: Text(
                                                            'Retur',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            // Get.toNamed(
                                                            //     Routes.PIUTANG);
                                                          },
                                                          icon: Image.asset(
                                                              'assets/icons/piutang_order.png'),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            // Get.toNamed(
                                                            //     Routes.PIUTANG);
                                                          },
                                                          child: Text(
                                                            'Piutang',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: const Color(0xFF3F8CE2)),
                                onPressed: () {},
                                child: Text(
                                  'LIHAT SEMUA JADWAL',
                                  style:
                                  GoogleFonts.poppins(color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
