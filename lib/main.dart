import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:salesforce/res/getx_localization/languages.dart';
import 'package:salesforce/routes/pages.dart';
import 'package:salesforce/view/home/home.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  setupOneSignal();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void loadingInstance() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2)
      ..loadingStyle = EasyLoadingStyle.custom
      ..radius = 10.0
      ..progressColor = Colors.green
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.green
      ..textColor = Colors.green
      ..maskColor = Colors.green.withOpacity(0.5)
      ..userInteractions = true
      ..boxShadow = [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(1, 4),
        )
      ]
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: Languages(),
      fallbackLocale: Locale("en", "US"),
      supportedLocales: const [
        Locale("ur", "PK")
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins",
      ),
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      initialRoute: Routes.INITIAL,
      getPages: Pages,
      builder: EasyLoading.init(),
    );
  }
}

void setupOneSignal() {
  // Mengatur tingkat log
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  // Mengatur App ID OneSignal (ganti dengan App ID yang sesuai)
  OneSignal.shared.setAppId("c924aa9d-5cc5-4264-9a48-62a6b17573b0");

  // Meminta izin notifikasi
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {
    print('Notification permission accepted: $accepted');
  });

  // Menangani notifikasi yang diterima saat aplikasi berada di foreground
  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    print('FOREGROUND HANDLER CALLED WITH: ${event.notification.jsonRepresentation()}');
    final data = event.notification.additionalData; // Menekan perilaku notifikasi default

    if (data != null) {
      print("Notification data: $data");
      try {
        final controller = Get.find<HomeController>(); // Mengambil instance controller
      //  controller.handleNotificationReceived(data);
      } catch (e) {
        print('Error handling notification: $e');
      }
    }
  });

  // Menangani notifikasi yang dibuka oleh pengguna
  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    print('NOTIFICATION OPENED HANDLER CALLED WITH: ${result.notification.jsonRepresentation()}');
    final data = result.notification.additionalData;
    if (data != null) {
      print("Notification data: $data");
      // Menangani notifikasi ( misalnya, navigasi ke layar tertentu)
      try {
        final controller = Get.find<HomeController>(); // Mengambil instance controller
       // controller.handleNotificationReceived(data);
      } catch (e) {
        print('Error handling notification: $e');
      }
    }
  });


}