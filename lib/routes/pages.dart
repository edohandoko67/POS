import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:salesforce/view/home/driver/controller/home.driver.controller.dart';
import 'package:salesforce/view/home/driver/home.driver.dart';
import 'package:salesforce/view/home/driver/homeDriver.fragment.dart';
import 'package:salesforce/view/home/driver/profileDriver.fragment.dart';
import 'package:salesforce/view/home/driver/test.dart';
import 'package:salesforce/view/home/produk.fragment.dart';
import 'package:salesforce/view/home/sales/detail.toko.dart';
import 'package:salesforce/view/home/home.binding.dart';
import 'package:salesforce/view/home/home.dart';
import 'package:salesforce/view/home/home.fragment.dart';
import 'package:salesforce/view/home/sales/info.toko.dart';
import 'package:salesforce/view/home/kebijakan.privacy.dart';
import 'package:salesforce/view/home/sales/maps.dart';
import 'package:salesforce/view/home/pengaturan.keamanan.dart';
import 'package:salesforce/view/home/pengaturan.profil.dart';
import 'package:salesforce/view/home/profile.fragment.dart';
import 'package:salesforce/view/home/pusat.bantuan.dart';
import 'package:salesforce/view/home/sales/not.order.dart';
import 'package:salesforce/view/home/sales/pengiriman/pengiriman.dart';
import 'package:salesforce/view/home/sales/pesan/message.user.dart';
import 'package:salesforce/view/home/sales/peta/detailMaps.dart';
import 'package:salesforce/view/home/sales/peta/mapsToko.dart';
import 'package:salesforce/view/home/sales/piutang.dart';
import 'package:salesforce/view/home/sales/retur.dart';
import 'package:salesforce/view/home/sales/sales.order.dart';
import 'package:salesforce/view/home/sales/stock/cart.dart';
import 'package:salesforce/view/home/sales/stock/detail.stock.dart';
import 'package:salesforce/view/home/sales/stock/stock.dart';
import 'package:salesforce/view/home/sales/toko/detail_toko_id.dart';
import 'package:salesforce/view/home/sales/toko/toko.dart';
import 'package:salesforce/view/home/syarat.dart';
import 'package:salesforce/view/home/sales/update.toko.dart';
import 'package:salesforce/view/login/login.binding.dart';
import 'package:salesforce/view/splash/splash.screen.dart';

import '../view/home/sales/controller/sales.binding.dart';
import '../view/login/login.dart';

part 'routes.dart';

List<GetPage> Pages = [
  GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500)
  ),
  GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500)
       ),
  GetPage(name: Routes.HOMEFRAGMENT, page: () => HomePageFragment(), binding: HomeBindings()),
  GetPage(name: Routes.HOME, page: () => Home(), binding: HomeBindings()),
  GetPage(
      name: Routes.PROFILE,
      page: () => ProfileFragment(),
      binding: HomeBindings(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
  // GetPage(
  //     name: Routes.FORGOT_PASSWORD,
  //     page: () => ForgotPassword(),
  //     binding: LoginBinding(),
  //     transition: Transition.fadeIn,
  //     transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: Routes.KEBIJAKAN,
      page: () => const KebijakanPrivacy(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: Routes.SYARAT,
      page: () => const Syarat(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: Routes.PUSATBANTUAN,
      page: () => const PusatBantuan(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: Routes.PENGATURANKEAMANAN,
      page: () => const PengaturanKeamanan(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: Routes.PENGATURANPROFIL,
      page: () => const PengaturanProfile(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: Routes.PRODUCTFRAGMENT,
      page: () => ProductFragment(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: Routes.DETAILTOKO,
      page: () => DetailToko(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.DETAILTOKOBYID,
      page: () => DetailTokoId(),
      binding: HomeBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.INFOTOKO,
      page: () => InformasiToko(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.TOKO,
      page: () => Toko(),
      binding: HomeBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.MAPS,
      page: () => Maps(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.MAPSTOKO,
      page: () => MapsToko(),
      binding: HomeBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.DETAILMAPSTOKO,
      page: () => DetailMaps(),
      binding: HomeBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.UPDATETOKO,
      page: () => UpdateToko(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.NOTORDER,
      page: () =>  NotOrder(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.SALESORDER,
      page: () => SalesOrder(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.RETUR,
      page: () => ReturOrder(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.PIUTANG,
      page: () => Piutang(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.STOCK,
      page: () => StockProduct(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.DETAIL_STOCK,
      page: () => DetailStock(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
    name: Routes.PENGIRIMAN,
    page: () => Pengiriman(),
    binding: SalesBinding(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fadeIn
  ),
  GetPage(
      name: Routes.NOTIFIKASI,
      page: () => MessageUser(),
      binding: HomeBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.HOMEDRIVER,
      page: () => HomeDriver(),
      binding: HomeDriverBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.HOMEDRIVERFRAGMENT,
      page: () => HomeDriverFragment(),
      binding: HomeDriverBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.PROFILEDRIVERFRAGMENT,
      page: () => ProfileDriverFragment(),
      binding: HomeDriverBindings(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.CART,
      page: () => Cart(),
      binding: SalesBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
];