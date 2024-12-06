import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:salesforce/auth/model/absen.toko.model.dart';
import 'package:salesforce/auth/model/cart.dart';
import 'package:salesforce/auth/model/image_detail_stock.dart';
import 'package:salesforce/auth/model/login.model.dart';
import 'package:salesforce/auth/model/message.dart';
import 'package:salesforce/auth/model/product.model.dart';
import 'package:salesforce/auth/model/satuan.product.dart';
import 'package:salesforce/auth/model/stock.product.dart';
import 'package:salesforce/auth/model/toko.dart';
import 'package:salesforce/auth/provider/api.provider.dart';
import '../model/jadwal.sales.dart';
import '../model/res.data.dart';
import '../model/tracking.dart';
import 'api.constant.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' hide MultipartFile;

import '../../utils/storage.dart';
class AuthService {
  HttpClient httpClient = HttpClient(baseUrl: ApiConstant.baseUrl);
  HttpClient httpClient2 = HttpClient(baseUrl: ApiConstant.baseUrl);
  final Storage _storage = Storage();

  Future<LoginModel> login(Map<String, dynamic> data) async {
    EasyLoading.show(
        status: 'Mohon tunggu...',
        maskType: EasyLoadingMaskType.black
    );
    try {
      dio.Response response = await httpClient.post(
        ApiConstant.login, data: data
      );
      final body = ResData.fromJson(response.data, (data) => LoginModel.fromJson(data));
      EasyLoading.dismiss();
      if (body.metaData?.code == 200) {
        _storage.login();
        _storage.saveId(body.data.idUser ?? 0);
        _storage.saveToken(body.data.accessToken ?? '');
        _storage.saveName(body.data.username ?? '');
        _storage.saveRole(body.data.role_user ?? '');
        _storage.saveNumber(body.data.number ?? '');
        _storage.savePassword(body.data.password ?? '');
        _storage.saveGender(body.data.gender ?? 0);
        return body.data;
      } else {
        EasyLoading.dismiss();
        throw Exception('Login gagal: ${body.metaData?.message ?? 'Tidak diketahui'}');
      }
    } on dio.DioError catch(_) {
      String error401 = _.error;
      if (error401.contains('401')) {
        Get.dialog(
            barrierDismissible: false,
            AlertDialog(
              contentPadding: const EdgeInsets.all(20.0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/img_stop.png',
                    height: 60.0,
                  ),
                  const SizedBox(height: 16.0,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Teliti kembali\n',
                        ),
                        TextSpan(
                          text: 'NIP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' dan ',
                        ),
                        TextSpan(
                          text: 'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' Anda.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Divider(
                    color: Colors.black,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAFB2B5),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            )
        );
      }
      if (!error401.contains('401')) {
        EasyLoading.showError('Gagal terhubung ke Server. Coba lagi!');
      }
      EasyLoading.dismiss();
      throw Exception(_.message);
    } catch (e) {
      EasyLoading.dismiss();
      print('General Error: $e');
      throw Exception(e.toString());
    }
  }

  Future<List<Product>> listProduct(Map<String, dynamic> data) async {
    try {
      dio.Response response = await httpClient.get(ApiConstant.listProduct);
      final body = ResData.fromJson(response.data, (json) => List<Product>.from(json.map((item) => Product.fromJson(item))));
      print(response.data);
      if (body.metaData?.code == 200) {
        // EasyLoading.showSuccess(
        //   "Berhasil mendapatkan data",
        // );
        return body.data;
      } else {
        return [];
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    } catch (e) {
      print('General Error: $e');
      throw Exception(e.toString());
    }
  }

  Future<List<SatuanProduct>> listSatuan(Map<String, dynamic> data) async {
    try {
      dio.Response response = await httpClient.get(ApiConstant.listSatuanProduct);
      final body = ResData.fromJson(response.data, (json) => List<SatuanProduct>.from(json.map((item) => SatuanProduct.fromJson(item))));
      print(response.data);
      if (body.metaData?.code == 200) {
        return body.data;
      } else {
        return [];
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    }
  }

  Future<bool> createProductRetur(Map<String, dynamic> data) async {
    EasyLoading.show(
      status: 'mohon tunggu...',
      maskType: EasyLoadingMaskType.black,
    );
    try {
      dio.Response response = await httpClient.post(ApiConstant.createProductRetur, data: data);
      final body = ResData.fromJson(response.data, (json) => Product.fromJson(json));
      EasyLoading.dismiss();
      if (body.metaData?.code == 201) {
        EasyLoading.showSuccess(
          "Berhasil menambahkan data",
        );
        return true;
      } else {
        return false;
      }
    } on dio.DioError catch (_) {
      EasyLoading.dismiss();
      EasyLoading.showError('Gagal terhubung ke Server. Coba lagi!');
      throw Exception(_.message);
    }
  }

  Future<bool> deleteProductRetur(Map<String, dynamic> data) async {
    EasyLoading.show(
      status: 'mohon tunggu...',
      maskType: EasyLoadingMaskType.black,
    );
    try {
      dio.Response response = await httpClient.delete(ApiConstant.deleteProductRetur, data: data);
     // final body = ResData.fromJson(response.data, (json) => Product.fromJson(json));
      final body = response.data;
      EasyLoading.dismiss();
      if (body["code"] == 200) {
        EasyLoading.showSuccess(body['message']);
        return true;
      } else {
        return false;
      }
    } on dio.DioError catch (_) {
      EasyLoading.dismiss();
      EasyLoading.showError('Gagal terhubung ke Server. Coba lagi!');
      throw Exception(_.message);
    }
  }

  Future<List<TokoModel>> listToko(Map<String, dynamic> data) async {
    EasyLoading.show(
      status: '',
      maskType: EasyLoadingMaskType.black,
    );
    try {
      dio.Response response = await httpClient.post(ApiConstant.listToko, data: data);
      final body = ResData.fromJson(response.data, (json) => List<TokoModel>.from(json.map((item) => TokoModel.fromJson(item))));
      if (body.metaData?.code == 200) {
        EasyLoading.dismiss();
        return body.data;
      } else {
        return [];
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    } catch (e, stackTrace) {
      print('Failed to load data: $e');
      print("stackTrace :$stackTrace");
      return [];
    }
  }

  Future<bool> createAbsenToko(Map<String, dynamic> data) async {
    try {
      dio.Response response = await httpClient.post(ApiConstant.createAbsenToko, data: data);
      final body = ResData.fromJson(response.data, (json) => AbsenTokoModel.fromJson(json));
      if (body.metaData?.code == 201) {
        return true;
      } else {
        return false;
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    } catch (e, stackTrace) {
      print("Error $e");
      print("StackTrace $stackTrace");
      return false;
    }
  }

  // Future<List<StockProduct>> listStock(Map<String, dynamic> data) async {
  //   try {
  //     dio.Response response = await httpClient.get(ApiConstant.stockProduct);
  //     final body = ResData.fromJson(response.data, (json) => List<StockProduct>.from(
  //         json.map((item) => StockProduct.fromJson(item))));
  //     if (body.metaData?.code == 200) {
  //       return body.data;
  //     } else {
  //       return [];
  //     }
  //   } on dio.DioError catch(_) {
  //     throw Exception(_.message);
  //   }
  // }

  Future<List<StockProduct>> fetchStockProducts() async {
    try {
      dio.Response response = await httpClient.get(ApiConstant.stockProduct);
      final body = ResData.fromJson(response.data, (json) => List<StockProduct>.from(
          json.map((item) => StockProduct.fromJson(item))));
      if (body.metaData?.code == 200) {
        return body.data;
      } else {
        return [];
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    }
  }

  Future<List<JadwalSales>> listSales(Map<String, dynamic> data) async {
    try {
      dio.Response response = await httpClient.get(ApiConstant.listKurir);
      final body = ResData.fromJson(response.data, (json) => List<JadwalSales>.from(
        json.map((item) => JadwalSales.fromJson(item))
      ));
      if (body.metaData?.code == 200) {
        return body.data;
      } else {
        return [];
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    }
  }

  Future<List<Tracking>> listTrackingProduct(Map<String, dynamic> data) async {
    try {
      dio.Response response = await httpClient.get(ApiConstant.listTrackingProduct);
      final body = ResData.fromJson(response.data, (json) => List<Tracking>.from(
          json.map((item) => Tracking.fromJson(item))
      ));
      if (body.metaData?.code == 200) {
        return body.data;
      } else {
        return [];
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    }
  }

  Future<List<ImageDetailStock>> listImageDetail(Map<String, dynamic> data) async {
    try {
      dio.Response response = await httpClient.get(ApiConstant.listIdDetailStock);
      final body = ResData.fromJson(response.data, (json) => List<ImageDetailStock>.from(
        json.map((item) => ImageDetailStock.fromJson(item))
      ));
      print("listImage: ${response.data}");
      if (body.metaData?.code == 200) {
        return body.data;
      } else {
        return [];
      }
    } on dio.DioError catch(_) {
      throw Exception(_.message);
    }
  }

  Future<List<Cart>> listCartById(Map<String, dynamic> data) async {
    try {
      dio.Response response = await httpClient.post(
        ApiConstant.findCartById,
        data: data,
      );
      print("Response Data: ${response.data}");
      final body = ResData.fromJson(
        response.data,
            (json) => List<Cart>.from(
          json.map((item) => Cart.fromJson(item)),
        ),
      );
      if (body.metaData?.code == 200) {
        return body.data;
      } else {
        print("Server Error: ${body.metaData?.message}");
        return [];
      }
    } on DioError catch (e) {
      print("DioError Response Data: ${e.response?.data}");
      print("DioError Message: ${e.message}");
      throw Exception(e.message);
    } catch (e, stackTrace) {
      print("General Error: ${e.toString()}");
      print("StackTrace: $stackTrace");
      throw Exception(e.toString());
    }
  }


  // //list dalam class
  // Future<Tracking?> trackingProduct(Map<String, dynamic> data) async {
  //   try {
  //     final dio.Response response = await httpClient.post(ApiConstant.trackingProduct, data: data);
  //     print('Raw response data: ${response.data}');
  //
  //     final responseData = response.data as Map<String, dynamic>?;
  //
  //     if (responseData == null) {
  //       print('Error: Response data is null');
  //       return null;
  //     }
  //
  //     final body = ResData<Tracking>.fromJson(
  //         responseData,
  //             (json) {
  //           final trackingData = json as Map<String, dynamic>?;
  //
  //           if (trackingData == null) {
  //             print('Error: Response data is not a map');
  //             return Tracking(
  //               idTracking: 0,
  //               nameProduct: '',
  //               status: '',
  //               date: null,
  //               noResi: '',
  //               nameSales: '',
  //               checkData: false,
  //               checkDataAfter: false,
  //               historyStatus: [],
  //             );
  //           }
  //
  //           final histories = (trackingData['histories'] as List<dynamic>?)
  //               ?.map((item) => HistoryStatus.fromJson(item as Map<String, dynamic>))
  //               .toList() ?? [];
  //
  //           return Tracking(
  //             idTracking: trackingData['idTracking'] as int? ?? 0,
  //             nameProduct: '', // Adjust if necessary
  //             status: trackingData['status'] as String? ?? '',
  //             date: trackingData['timestamp'] != null
  //                 ? DateTime.parse(trackingData['timestamp'] as String)
  //                 : null,
  //             noResi: trackingData['noResi'] as String? ?? '',
  //             nameSales: '', // Adjust if necessary
  //             checkData: trackingData['checkingData'] as bool? ?? false,
  //             checkDataAfter: trackingData['checkingDataAfter'] as bool? ?? false,
  //             historyStatus: histories,
  //           );
  //         }
  //     );
  //
  //     if (body.metaData?.code == 200) {
  //       print("Tracking successful: ${response.data}");
  //       return body.data;
  //     } else {
  //       print("Error: ${body.metaData?.message}");
  //       return null;
  //     }
  //   } on dio.DioError catch (e) {
  //     throw Exception(e.message);
  //   } catch (e, stackTrace) {
  //     print('Error: ${e.toString()}');
  //     print('StackTrace: $stackTrace');
  //     return null;
  //   }
  // }

  
  Future<Tracking?> trackingProduct(Map<String, dynamic> data) async {
      try {
        dio.Response response = await httpClient.post(ApiConstant.trackingProduct, data: data);
        final body = ResData.fromJson(response.data, (json) => Tracking.fromJson(json));
        if (body.metaData?.code == 200) {
          print("tracking: ${response.data}");
          return body.data;
        } else {
          return null;
        }
      } on dio.DioError catch (e) {
        throw Exception(e.message);
      } catch (e, stackTrace) {
        print('Error: ${e.toString()}');
        print('StackTrace: $stackTrace');
        return null;
      }
    }

    Future<bool> createCheckout(Map<String, dynamic> data) async {
    EasyLoading.showSuccess("");
      try {
        dio.Response response = await httpClient.post(ApiConstant.createCart, data: data);
        final body = ResData.fromJson(response.data, (json) => Cart.fromJson(json));
        if(body.metaData?.code == 201) {
          return true;
        } else {
          return false;
        }
      } on dio.DioError catch(_) {
        throw Exception(_.message);
      } catch (e, stackTrace) {
        print(e);
        print(stackTrace);
        return false;
      }
    }

  Future<List<Message>> listNotifikasi() async {
    EasyLoading.show();
      try {
          dio.Response response = await httpClient.get(ApiConstant.notifikasi);
          final body = ResData.fromJson(response.data, (json) => List<Message>.from(
                  json.map((item) => Message.fromJson(item))));
          if (body.metaData?.code == 200) {
            EasyLoading.dismiss();
            return body.data;
          } else {
            return [];
          }
        } on dio.DioError catch(_) {
        throw Exception(_.message);
      }
    }

}