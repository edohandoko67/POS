import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/remote/api/api_endpoints.dart';
// import 'package:salesforce/auth/service/api.constant.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

import '../../routes/pages.dart';

class HomePageFragment extends GetView<HomeController> {
  HomePageFragment({super.key});
  SalesController salesController = Get.put(SalesController());
  List<Map<String, dynamic>> toko = [
    {
      'image': 'assets/images/toko_jaya.png',
      'name': 'TOKO SUKSES JAYA 1',
      'desc':
          'Jl. Pahlawan No. 10, Mojopurno, Kecamatan Magersari, Kota Mojokerto, Jawa Timur'
    },
    {
      'image': 'assets/images/toko_madura.png',
      'name': 'TOKO SUKSES JAYA 2',
      'desc':
          'Jl. Pahlawan No. 10, Mojopurno, Kecamatan Magersari, Kota Mojokerto, Jawa Timur'
    },
    {
      'image': 'assets/images/toko_sukses.png',
      'name': 'TOKO SUKSES JAYA 3',
      'desc':
          'Jl. Pahlawan No. 10, Mojopurno, Kecamatan Magersari, Kota Mojokerto, Jawa Timur'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: controller.checklist.value
                 ? const AssetImage('assets/images/bg.png')
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
                      IconButton(
                        icon: controller.isMessageSender.value
                        ? Icon(Icons.message, color: Colors.red[300],)
                        : const Icon(Icons.message, color: Colors.white,),
                        onPressed: () {
                         //controller.notificationMessage();
                          Get.toNamed(Routes.NOTIFIKASI);
                        },
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
                      AnimatedSwitcher(duration: const Duration(seconds: 1),
                        child: controller.checklist.value
                            ? const Icon(
                          Icons.wb_sunny,
                          key: ValueKey('awakeIcon'),
                          size: 30,
                          color: Colors.yellow,
                        )
                            : const Icon(
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
                                                            const Size(100, 45),
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
                                                            const Size(100, 45),
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
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                          ? Image.asset('assets/icons/jadwal.png')
                                          : Image.asset('assets/icons/jadwal_istirahat.png'),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Jadwal',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.getDataToko();
                                    controller.resetCompleter();
                                    Get.toNamed(Routes.DETAILMAPSTOKO);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                          ? Image.asset('assets/icons/peta.png')
                                          : Image.asset('assets/icons/peta_istirahat.png'),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Peta',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.getDataToko();
                                    Get.toNamed(Routes.TOKO);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                          ? Image.asset('assets/icons/toko.png')
                                          : Image.asset('assets/icons/toko_istirahat.png'),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Toko',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {
                                    if (controller.checklist.value) {
                                      salesController.fetchAllProducts();
                                      salesController.fetchDetailImage();
                                      Get.toNamed(Routes.STOCK);
                                    } else {
                                      // Get.snackbar(
                                      //     "Status Sedang Istirahat",
                                      //     "Anda sedang offline mohon aktifkan status untuk bekerja",
                                      //     backgroundColor: Colors.green,
                                      //     colorText: Colors.white,
                                      //     duration: const Duration(seconds: 2), // Durasi popup
                                      //     animationDuration: const Duration(milliseconds: 800));
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                          ? Image.asset('assets/icons/stok.png')
                                          : Image.asset('assets/icons/stok_istirahat.png'),
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
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                        ? Image.asset('assets/icons/piutang.png')
                                        : Image.asset('assets/icons/piutang_istirahat.png'),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Piutang',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {
                                    // salesController.fecthDataTracking();
                                    // salesController.trackingKurir();
                                    Get.toNamed(Routes.PENGIRIMAN);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                        ? Image.asset('assets/icons/pengiriman.png')
                                        : Image.asset('assets/icons/pengiriman_istirahat.png'),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Pengiriman',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                        ? Image.asset('assets/icons/laporan.png')
                                        : Image.asset('assets/icons/laporan2.png'),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Laporan',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: !controller.checklist.value,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.checklist.value
                                        ? Image.asset('assets/icons/sinkron.png')
                                        : Image.asset('assets/icons/sinkron_istirahat.png'),
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
                          SizedBox(
                            height: 200,
                            child: Obx(() {
                              if (controller.listToko.isEmpty) {
                                return Center(
                                  child: Text("No schedule now", style: GoogleFonts.poppins(),),
                                );
                              } else {
                                return ListView.builder(
                                  itemCount: controller.listToko.length,
                                  itemBuilder: (context, index) {
                                    final item = controller.listToko[index];
                                    return ListTile(
                                      leading: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.network(
                                            (ApiEndPoints.baseUrl + item.image.toString()),
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
                                      trailing: IgnorePointer(
                                        ignoring: !controller.checklist.value,
                                        child: IconButton(
                                          icon: controller.checklist.value
                                              ? Image.asset('assets/icons/node.png')
                                              : Image.asset('assets/icons/node_istirahat.png'),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: SingleChildScrollView(
                                                    child: SizedBox(
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
                                                                  controller.getImageFromCamera();
                                                                },
                                                                icon: Image.asset(
                                                                    'assets/icons/absen_toko.png'),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.getImageFromCamera();
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
                                                                  Get.toNamed(Routes.DETAILTOKO, arguments: item);
                                                                },
                                                                icon: Image.asset(
                                                                    'assets/icons/detail_toko.png'),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.toNamed(Routes.DETAILTOKO, arguments: item);
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
                                                                  Get.toNamed(Routes
                                                                      .SALESORDER);
                                                                },
                                                                icon: Image.asset(
                                                                    'assets/icons/sales_order.png'),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.toNamed(Routes
                                                                      .SALESORDER);
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
                                                                  Get.toNamed(Routes
                                                                      .NOTORDER);
                                                                },
                                                                icon: Image.asset(
                                                                    'assets/icons/not_order.png'),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.toNamed(Routes
                                                                      .NOTORDER);
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
                                                                  Get.toNamed(
                                                                      Routes.RETUR);
                                                                  salesController.listProductBarang();
                                                                },
                                                                icon: Image.asset(
                                                                    'assets/icons/return.png'),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.toNamed(
                                                                      Routes.RETUR);
                                                                  salesController.listProductBarang();
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
                                                                  Get.toNamed(
                                                                      Routes.PIUTANG);
                                                                },
                                                                icon: Image.asset(
                                                                    'assets/icons/piutang_order.png'),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.toNamed(
                                                                      Routes.PIUTANG);
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
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                          )),
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
      )
    );
  }
}
