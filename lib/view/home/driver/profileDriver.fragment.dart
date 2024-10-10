import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/driver/controller/home.driver.controller.dart';
import 'package:salesforce/view/login/login.controller.dart';

import '../../../routes/pages.dart';


class ProfileDriverFragment extends GetView<HomeDriverController> {
  ProfileDriverFragment({super.key});

  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_driver.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 19.0),
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
                  Text(
                    'Aplikasi untuk mempermudah transaksi',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Untuk diperoleh informasi yang akurat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFFF0943A)),
                          ),
                          subtitle: const Text('Lengkapi profil Anda!'),
                          trailing: SizedBox(
                            width: 120,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3F8CE2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(context: context, builder: (BuildContext context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/icons/choice.png'),
                                        const SizedBox(height: 5,),
                                        const Text('Anda ingin istirahat?'),
                                        const SizedBox(height: 5,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(100, 45),
                                                    backgroundColor: const Color(0xFF3C65F6),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5)
                                                    )
                                                ),
                                                onPressed: () {}, child: Text('YA, TENTU', style: GoogleFonts.poppins(
                                              color: Colors.white,
                                            ),)),
                                            const SizedBox(width: 5,),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(100, 45),
                                                    backgroundColor: Colors.grey,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5)
                                                    )
                                                ),
                                                onPressed: () {}, child: Text('TIDAK', style: GoogleFonts.poppins(
                                              color: Colors.white,
                                            ))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                              child: Text(
                                'Lengkapi',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Pengaturan Profil'),
                              Image.asset('assets/icons/right.png')
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(Routes.PENGATURANPROFIL);
                          },
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Pengaturan Keamanan'),
                              Image.asset('assets/icons/right.png')
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(Routes.PENGATURANKEAMANAN);
                          },
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Pusat Bantuan'),
                              Image.asset('assets/icons/right.png')
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(Routes.PUSATBANTUAN);
                          },
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Syarat dan Ketentuan'),
                              Image.asset('assets/icons/right.png')
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(Routes.SYARAT);
                          },
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/user.png'),),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Kebijakan Privasi'),
                              Image.asset('assets/icons/right.png')
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(Routes.KEBIJAKAN);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              isDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icons/choice.png'),
                                      const Text('Apakah Anda Yakin?'),
                                      const SizedBox(height: 5,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(0xFF3C65F6),
                                                  minimumSize: const Size(100, 40),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)
                                                  )
                                              ),
                                              onPressed: () {
                                                loginController.logout();
                                              }, child: Text('YA, TENTU', style: GoogleFonts.poppins(
                                            color: Colors.white,
                                          ),)),
                                          const SizedBox(width: 5,),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(0xFF758AA3),
                                                  minimumSize: const Size(100, 40),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)
                                                  )
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }, child: Text('TIDAK', style: GoogleFonts.poppins(
                                            color: Colors.white,
                                          ))),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Text('KELUAR APLIKASI', style: GoogleFonts.poppins(
                            color: const Color(0xFFB04949)
                        ),)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
