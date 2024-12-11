import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salesforce/repository/repository.dart';
// import 'package:salesforce/auth/model/absen.toko.model.dart';
// import 'package:salesforce/auth/model/cart.dart';
// import 'package:salesforce/auth/model/image_detail_stock.dart';
// import 'package:salesforce/auth/model/jadwal.sales.dart';
// import 'package:salesforce/auth/model/login.model.dart';
// import 'package:salesforce/auth/model/product.model.dart';
// import 'package:salesforce/auth/model/satuan.product.dart';
// import 'package:salesforce/auth/model/stock.product.dart';
// import 'package:salesforce/auth/service/auth.service.dart';
import 'package:salesforce/utils/storage.dart';
import 'package:salesforce/view/home/sales/image.keterangan.dart';

import '../../../../model/Product.dart';
import '../../../../model/SatuanProduct.dart';
import '../../../../model/StockProduct.dart';
import '../../../../model/Tracking.dart';
import '../../../../utils/utils.dart';
// import '../../../../auth/model/tracking.dart';


class SalesController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();
  Repository repository = Repository();
  TextEditingController date = TextEditingController();
  Storage storage = Storage();
  TextEditingController nameProduct = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  TextEditingController pembuatProduct = TextEditingController();
  TextEditingController alasanProduct = TextEditingController();
  TextEditingController discountProduct = TextEditingController();
  TextEditingController quantityProduct = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController searchProduct = TextEditingController();
  TextEditingController TextNoResi = TextEditingController();
  TextEditingController quantityCart = TextEditingController();

  var count = 0.obs;
  RxInt currentindex = 0.obs;
  RxBool checklist = false.obs;
  int? idSatuanProduct;
  RxBool isLoading = true.obs;

  Rx<LatLng> officeLocation = const LatLng(-7.482151427258845, 112.44826629209244).obs;
  // Rx<AbsenTokoModel> absenToko = AbsenTokoModel().obs;
  int? idSalesController;

  RxDouble total = 0.0.obs;

  @override
  void onInit() async {
    super.onInit();
    listSatuan();
    // fecthAllKurir();
    // fecthDataTracking();
    fetchAllProducts();
    // double? latitude = (absenToko.value.latitude ?? 0).toDouble();
    // double? longitude = (absenToko.value.longitude ?? 0).toDouble();
    // officeLocation = LatLng(latitude, longitude).obs;
    print("lokasi : $officeLocation");
    _currentLocation();

  }

  void increment() {
    count++;
    print("increment: $count");
  }

  void decrement() {
    if (count < 1) {
      print("maximum count");
    } else {
      count--;
    }
  }


  @override
  void onClose() {
    // Dispose of resources when controller is disposed
    mapController.future.then((controller) => controller.dispose());
    super.onClose();
  }


  List<Map<String, dynamic>> stock = [
    {
      'image': 'assets/images/kopi.png',
      'title': 'Tora Moka',
      'price': 'Rp 15000',
      'stock': '12'
    },
    {
      'image': 'assets/images/kopi.png',
      'title': 'Tora Susu',
      'price': 'Rp 17000',
      'stock': '10'
    },
  ];

  // var selectedProduct = Rx<ImageDetailStock?>(null);
  //
  // // Method untuk mengubah produk yang dipilih
  // void selectProduct(ImageDetailStock stock) {
  //   selectedProduct.value = stock;
  // }


  final ImagePicker _picker = ImagePicker();
  Rx<File?> imagePath = Rx<File?>(null);
  RxString fileName = ''.obs;
  Future<void> getImageFromCamera() async {
    try {
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
    } catch (e) {
      print('Error $e');
    }

  }

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

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
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // Position position = await Geolocator.getCurrentPosition();
    // print(position.latitude);
    // print(position.longitude);
    // locationModel?.latitude = position.latitude;
    // locationModel?.longitude = position.longitude;
    // print(locationModel);
    // print(position);
  }

  RxList<Product> listBarang = <Product>[].obs;
  Future<void> listProductBarang() async {
    try {
      isLoading.value = true;
      listBarang.value = await repository.listProduct();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

    total.value = listBarang.map((item) => item.price ?? 0.0).sum;
    print('Total : ${total.value}');
    print('jumlah : ${listBarang.value.length}');

  }

  RxList<SatuanProduct> listSatuanProduct = <SatuanProduct>[].obs;
  Future<void> listSatuan() async {
    try {
      isLoading.value = true;
      listSatuanProduct.value = await repository.listSatuan();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

  }
  //
  // Rx<Product> productBarang = Product().obs;
  // Future<void> createProductReturn() async {
  //   bool result = await service.createProductRetur({
  //     "name" : nameProduct.text,
  //     "price": priceProduct.text,
  //     "pembuat": pembuatProduct.text,
  //     "alasan": alasanProduct.text,
  //     "discount": discountProduct.text,
  //     "quantity": quantityProduct.text
  //   });
  //   if (result) {
  //     listProductBarang();
  //     nameProduct.clear();
  //     priceProduct.clear();
  //     pembuatProduct.clear();
  //     alasanProduct.clear();
  //     discountProduct.clear();
  //     quantityProduct.clear();
  //   }
  // }
  //
  Future<void> deleteProductReturn(int id) async {
    Map data = {
      "id_product": id
    };
    bool result = await repository.deleteProductRetur(data);
    if (result) listProductBarang();
  }
  //
  //
  // Future<void> createAbsen() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     bool result = await service.createAbsenToko({
  //       "image_absen": imagePath.value == null ? null : await MultipartFile.fromFile(imagePath.value!.path),
  //       "latitude": position.latitude,
  //       "longitude": position.longitude,
  //       "keterangan": keterangan.text
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // RxList<StockProduct> listStockProduct = <StockProduct>[].obs;
  // // Future<void> listStock() async {
  // //   try {
  // //     listStockProduct.value = await service.listStock({
  // //       "" : ""
  // //     });
  // //   } catch (e, stackTrace) {
  // //     print('error : $e');
  // //     print('stackTrace : $stackTrace');
  // //   }
  // // }
  //
  var allStockProducts = <StockProduct>[].obs; // Using RxList
  var filteredStockProducts = <StockProduct>[].obs; // Using RxList

  void fetchAllProducts() async {
    try {
      var products = await repository.fetchStockProducts();
      allStockProducts.assignAll(products); // Assign products to allStockProducts
      filteredStockProducts.assignAll(products); // Assign products to filteredStockProducts
    } catch (e) {
      print("Error in fetchAllProducts: $e");
    }
  }

  void searchProducts(String query) {
    filteredStockProducts.value = allStockProducts
        .where((product) => product.productName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  //
  // RxList<JadwalSales> listKurir = <JadwalSales>[].obs;
  // void fecthAllKurir() async {
  //   listKurir.value = await service.listSales({
  //     "" : ""
  //   });
  // }
  //
  Rx<Tracking> trackingBarang = Tracking().obs;
  RxList<Tracking> trackingProduct = <Tracking>[].obs;
  // void fecthDataTracking() async {
  //   trackingProduct.value = await service.listTrackingProduct({
  //     "" : ""
  //   });
  // }

  RxBool isTrackingVisibility = false.obs;
  Future<void> trackingKurir() async {
    try {
      Map data = {
        "noResi": TextNoResi.text
      };
      repository.trackingProduct(data).then((value) {
        if (value != null) {
          trackingProduct.value = [value];  // Assign result to trackingProduct
          isTrackingVisibility.value = true; // Make tracking visible
          print("Tracking berhasil!"); // Log successful tracking
        } else {
          trackingProduct.value = [];  // Clear tracking data if result is null
          isTrackingVisibility.value = false; // Hide tracking info
          print("Tracking gagal!"); // Log failed tracking
        }
      }).onError((error, stackTrace) {
        Utils.snackBar('error', error.toString());
      });
    } catch (e, stackTrace) {
      print("Terjadi kesalahan: $e");
      print("StackTrace: $stackTrace");
      trackingProduct.value = [];  // Clear list in case of error
      isTrackingVisibility.value = false; // Hide tracking info on error
    }
  }

//
  // RxList<ImageDetailStock> listDetailStock = <ImageDetailStock>[].obs;
  // Future<void> fetchDetailImage() async {
  //   try {
  //     listDetailStock.value = await service.listImageDetail({
  //       "" : ""
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // void updateLoginModel(LoginModel model) {
  //   loginModel.value = model;
  //   addToCart();
  // }
  //
  // Rx<LoginModel> loginModel = LoginModel().obs;
  // Future<void> addToCart() async {
  //   try {
  //     var idStock = selectedProduct.value?.idImageDetail;
  //     //var userId = loginModel.value.idUser;
  //     print("userId: ${storage.getId}");
  //     // if (userId == 0 || userId == null) {
  //     //   throw Exception("User ID is not set or invalid.");
  //     // }
  //     var result = await service.createCheckout({
  //       "userId": storage.getId(),
  //       "id_stock": idStock,
  //       "quantity": count.value
  //     });
  //     if (result) {
  //       count.value = 0;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  //
  // RxList<Cart> cartList = <Cart>[].obs;
  // Future<void> listCartById() async {
  //   try {
  //     cartList.value = await service.listCartById({
  //       "userId" : storage.getId()
  //     });
  //   } catch (e, stackTrace) {
  //     print("Error: ${e.toString()}");
  //     print("stackTrace: ${stackTrace.toString()}");
  //   }
  // }

// void trackingKurir() async {
  //   try {
  //     bool result = await service.trackingProduct({
  //       "noResi": TextNoResi.text
  //     });
  //     if (result) {
  //       print("Tracking berhasil!");
  //     } else {
  //       print("Tracking gagal!");
  //     }
  //   } catch (e, stackTrace) {
  //     print("Terjadi kesalahan: $e");
  //     print("Terjadi kesalahan: $stackTrace");
  //   }
  // }

}


