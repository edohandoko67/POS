import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:salesforce/view/home/home.controller.dart';
import 'package:salesforce/view/home/home.fragment.dart';
import 'package:salesforce/view/home/produk.fragment.dart';
import 'package:salesforce/view/home/profile.fragment.dart';

class Home extends GetView<HomeController> {
  Home({super.key});

  final controllerBar = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen(value) {
    return [
      RefreshIndicator(
          key: controller.refreshIndicatorKey,
          onRefresh: controller.refreshHomeFragment,
          child: HomePageFragment()),
      Container(),
      HomePageFragment(),
      ProductFragment(),
      ProfileFragment(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: controller.isLoading.value
            ? const CircularProgressIndicator(
              color: Color(0xFF3F8CE2),
            )
            : const Icon(Icons.home),
        activeColorPrimary: Colors.black,
        inactiveIcon: const Icon(Icons.home, color: Colors.grey,),
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => HomePageFragment(),
            },
          ),
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.history),
          inactiveIcon: const Icon(Icons.history, color: Colors.grey,)),
      PersistentBottomNavBarItem(
          icon: Image.asset('assets/icons/login.png',)),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.production_quantity_limits),
          inactiveIcon: const Icon(Icons.production_quantity_limits, color: Colors.grey,)),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          inactiveIcon: const Icon(Icons.person, color: Colors.grey,)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: controllerBar,
          screens: _buildScreen(controller.currentindex.value),
          items: _navBarItems(),
          backgroundColor: Colors.white,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(1),
          ),
          navBarStyle: NavBarStyle.style15,
          onItemSelected: (_) {
            if(_ == 0) {
              controller.refreshHomeFragment();
            }
            else if (_ == 2) {
              controller.checklist.value
              ? showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/choice.png'),
                        const Text('Pilih absen Anda!'),
                        const SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3C65F6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                  )
                                ),
                                onPressed: () {}, child: Text('Mulai Bekerja', style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),)),
                            const SizedBox(width: 5,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF758AA3),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)
                                    )
                                ),
                                onPressed: () {}, child: Text('Selesai Bekerja', style: GoogleFonts.poppins(
                              color: Colors.white,
                            ))),
                          ],
                        ),
                      ],
                    ),
                  );
              })
              : showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/choice.png'),
                          const SizedBox(height: 5,),
                          Center(
                            child: Text("Anda sedang offline \nBeberapa fitur tidak berfungsi \nAktifkan fitur untuk absensi",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[800]
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }
          },
        )
      ),
    ));
  }
}
