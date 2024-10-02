import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:salesforce/auth/model/login.model.dart';
import 'package:salesforce/auth/model/toko.dart';
import 'package:salesforce/auth/service/auth.service.dart';
import 'package:salesforce/auth/utils/storage.dart';
import 'package:salesforce/view/home/home.fragment.dart';
import 'package:salesforce/view/home/sales/image.keterangan.dart';

import '../../auth/model/message.dart';

class HomeController extends GetxController {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  AuthService service = AuthService();
  TextEditingController date = TextEditingController();
  TextEditingController search = TextEditingController();
  final Storage storage = Storage();
  RxInt currentindex = 0.obs;
  RxBool checklist = true.obs;
  RxBool isObsecure = true.obs;
  RxBool isObsecureNew = true.obs;
  RxBool isObsecureRepeat = true.obs;
  RxBool isMessageSender = true.obs;
  Rx<LatLng> officeLocation = const LatLng(-7.4822812, 112.4461984).obs;
  RxBool isLoading = false.obs;
  RxBool isMapReady = false.obs;
  var productList = <Map<String, String>>[].obs; //product asli
  var filteredProducts = <Map<String, String>>[].obs;

  @override
  void onInit() async {
    _currentLocation();
    super.onInit();
    resetCompleter();

    productList.addAll([
      {
        'image': 'assets/images/kopi.png',
        'name': 'Kopi Susu',
        'harga': 'Rp 5000/pcs'
      },
      {
        'image': 'assets/images/kopi.png',
        'name': 'Tora Susu',
        'harga': 'Rp 6000/pcs'
      },
      {
        'image': 'assets/images/tarik.png',
        'name': 'Teh Tarik',
        'harga': 'Rp 12000/pcs'
      },
      {
        'image': 'assets/images/mizagrip.png',
        'name': 'Mixagrip',
        'harga': 'Rp 4500/pcs'
      },
      {
        'image': 'assets/images/mizone.jpg',
        'name': 'Mizone',
        'harga': 'Rp 4500/botol'
      },
      {
        'image': 'assets/images/rokok.jpg',
        'name': 'Rokok La Ice',
        'harga': 'Rp 32000/bungkus'
      },
    ]);
    filteredProducts.addAll(productList);
    search.addListener(() {
      filterProduct(search.text);
    });
  }

  @override
  void onClose() {
    // Dispose of resources when controller is disposed
    mapController.future.then((controller) => controller.dispose());
    super.onClose();
  }

  final ImagePicker _picker = ImagePicker();
  Rx<File?> imagePath = Rx<File?>(null);
  RxString fileName = ''.obs;
  Future<void> getImageFromCamera() async {
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      //diharuskan memperbarui imagePath setelah pickedFile!
      imagePath.value = File(pickedFile.path);
      fileName.value = pickedFile.path.split('/').last;
      Get.back();
      _currentLocation();
      Get.to(() => ImageKeterangan(imagePath: pickedFile.path), arguments: position);
    } else {
      print('No image selected.');
    }
  }

  void tooglesecure() {
    isObsecure.value = !isObsecure.value;
  }

  void tooglesecureNew() {
    isObsecureNew.value = !isObsecureNew.value;
  }

  void tooglesecureRepeat() {
    isObsecureRepeat.value = !isObsecureRepeat.value;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    isMapReady.value = true; // Set peta siap
  }

  void resetCompleter() {
    mapController = Completer<GoogleMapController>(); // Inisialisasi Completer baru
  }


  Set<Marker> markers = {};

  void updateMarkers() {
    markers.clear();
    for (var toko in listToko) {
      markers.add(
        Marker(
          markerId: MarkerId(toko.nameToko ?? ''),
          position: LatLng(toko.latitude ?? 0.0, toko.longitude ?? 0.0),
          infoWindow: InfoWindow(title: toko.nameToko),
          icon: BitmapDescriptor.defaultMarker,
        )
      );
      print("lat: ${toko.latitude} long: ${toko.longitude}");
    }
  }

// Update cameraView
  Future<void> onCameraMove(double latitude, double longitude) async {
    if (!isMapReady.value) return; // Hanya lanjut jika peta siap
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
  }

  Rx<TokoModel> selectedArea = TokoModel().obs;

  void onAreaSelected(TokoModel selectedArea2) {
    selectedArea.value = selectedArea2;
    officeLocation.value = LatLng(
      selectedArea2.latitude ?? 0.0,
      selectedArea2.longitude ?? 0.0,
    );
    print(officeLocation.value.latitude);
    if (isMapReady.value) {
      onCameraMove(officeLocation.value.latitude, officeLocation.value.longitude);
    }
    _currentLocation(); // Pastikan ini diimplementasikan
  }

// If you need to reinitialize when navigating back to the view:

  Future<void> _currentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    //serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('', 'Location Permission Denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  RxBool isLoadingToko = true.obs;
  RxList<TokoModel> listToko = <TokoModel>[].obs;
  Future<void> getDataToko() async {
    try {
      isLoadingToko.value = true;
      listToko.value = await service.listToko({
        "userId" : storage.getId()
      });
      updateMarkers();
      print("userId toko: ${storage.getId()}");
    } catch (e, stackTrace) {
     print("error:  $e");
     print("stackTrace: $stackTrace");
    } finally {
      isLoadingToko.value = false;
    }
  }

  //filter data product static
  void filterProduct(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(productList);
    } else {
      filteredProducts.assignAll(
        productList.where((product) => product['name']!.toLowerCase().contains(query.toLowerCase())).toList()
      );
    }
  }

  Future<void> refreshHomeFragment() async {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      isLoading.value = false;
      getDataToko();
    });
  }

  void handleNotificationReceived(Map<String, dynamic> data) {
    String? destination = data['destination'];
    if (destination != null) {
      switch (destination) {
        case 1 :
          Get.to(HomePageFragment());
          break;
      }
    }

    notificationMessage(); // Or any specific logic you need
  }

  RxList<Message> messageList = <Message>[].obs;
  Future<void> notificationMessage() async {
    if (isMessageSender.value) {
      messageList.value = await service.listNotifikasi();
    }

  }
  final Set<int> _readMessageIds = <int>{}.obs;
  void markMessageAsRead(int id) {
    _readMessageIds.add(id);
    update(); // Refresh UI if needed
  }

  bool isMessageRead(int id) {
    return _readMessageIds.contains(id);
  }


}