import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:salesforce/data/network/network_api_service.dart';
import 'package:salesforce/model/ImageDetailStock.dart';
import 'package:salesforce/model/SatuanProduct.dart';
import 'package:salesforce/model/StockProduct.dart';
import 'package:salesforce/remote/api/api_endpoints.dart';
import 'package:salesforce/utils/storage.dart';

import '../model/Cart.dart';
import '../model/Product.dart';
import '../model/TokoModel.dart';
import '../model/Tracking.dart';

class Repository {
  NetworkApiService networkApiService = NetworkApiService();
  final Storage _storage = Storage();

  Future<dynamic> login(var data) async {
    EasyLoading.show(
        status: 'Mohon tunggu...',
        maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.postApi(data, ApiEndPoints.login);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        _storage.login();
        _storage.saveToken(response['response']['accessToken']);
        _storage.saveRole(response['response']['role']);
        _storage.saveName(response['response']['username']);
        _storage.saveId(response['response']['idUser']);
        print('accessToken: ${response['response']['accessToken']}');
      } else {
        EasyLoading.dismiss();
        throw Exception("Login failed: ${response['metaData']['message']}");
      }
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print("Error: $e");
      rethrow;
    }
  }

  Future<List<TokoModel>> listToko(var data) async {
    EasyLoading.show(
        status: '',
        maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.postApi(data, ApiEndPoints.listToko);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        List<TokoModel> tokoList = (response['response'] as List)
            .map((item) => TokoModel.fromJson(item))
            .toList();
        return tokoList;
      } else {
        EasyLoading.dismiss();
        return [];
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      return [];
    }
  }

  Future<List<Product>> listProduct() async {
    EasyLoading.show(status: 'Loading...', maskType: EasyLoadingMaskType.black);
    try {
      dynamic response = await networkApiService.getApi(ApiEndPoints.listProduct);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        List<Product> productList = (response['response'] as List)
            .map((item) => Product.fromJson(item))
            .toList();
        print("Product list loaded: ${productList.length} items.");
        return productList;
      } else {
        EasyLoading.showError("Failed to load products.");
        return [];
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();
      print("Error: $e");
      print("StackTrace: $stackTrace");
      EasyLoading.showError('An error occurred while fetching products.');
      return [];
    }
  }

  Future<dynamic> fetchStockProducts() async {
    EasyLoading.show(
        status: '',
        maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.getApi(ApiEndPoints.stockProduct);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        List<StockProduct> productFetch = (response['response'] as List)
            .map((item) => StockProduct.fromJson(item))
            .toList();
        return productFetch;
      } else {
        EasyLoading.dismiss();
        return []; // Return an empty list in case of failure
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("Error in fetchStockProducts: $e");
      return []; // Return an empty list in case of error
    }
  }

  Future<dynamic> trackingProduct(var data) async {
    EasyLoading.show(
      status: '',
      maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.postApi(data, ApiEndPoints.trackingProduct);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        var trackingData = response['response'];
        return Tracking.fromJson(trackingData);
      } else {
        return null;
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      return null;
    }
  }

  Future<dynamic> deleteProductRetur(var data) async {
    EasyLoading.show(
      status: '',
      maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.deletetApi(data, ApiEndPoints.deleteProductRetur);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        return response['response'];
      } else {
        return response['metaData']['message'];
      }
    } catch (e) {
      EasyLoading.dismiss();
      print('Error: $e');
      EasyLoading.showError('Error occurred while processing the request');
      return null;
    }
  }

  Future<dynamic> listSatuan() async {
    EasyLoading.show(
        status: '',
        maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.getApi(ApiEndPoints.listSatuanProduct);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        List<SatuanProduct> satuanList = (response['response'] as List)
            .map((item) => SatuanProduct.fromJson(item))
            .toList();
        return satuanList;
      } else {
        EasyLoading.dismiss();
        return [];
      }
    } catch (e) {
      EasyLoading.dismiss();
      return [];
    }
  }

  Future<dynamic> createCheckout(var data) async {
    EasyLoading.show(
        status: '',
      maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.postApi(data, ApiEndPoints.createCart);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        return response['response'];
      } else {
        return response['metaData']['message'];
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  Future<dynamic> listImageDetail() async {
    EasyLoading.show(
      status: '',
      maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.getApi(ApiEndPoints.listIdDetailStock);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        List<ImageDetailStock> imageListDetail = (response['response'] as List)
            .map((item) => ImageDetailStock.fromJson(item))
            .toList();
        return imageListDetail;
      } else {
        return [];
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  Future<dynamic> listCartById(var data) async {
    EasyLoading.show(
      status: '',
      maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.postApi(data, ApiEndPoints.findCartById);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        List<Cart> cartList = (response['response'] as List)
            .map((item) => Cart.fromJson(item))
            .toList();
        return cartList;
      } else {
        return [];
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

}