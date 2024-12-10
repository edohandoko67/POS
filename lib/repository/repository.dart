import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:salesforce/data/network/network_api_service.dart';
import 'package:salesforce/model/StockProduct.dart';
import 'package:salesforce/remote/api/api_endpoints.dart';
import 'package:salesforce/utils/storage.dart';

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
      if (response['metaData']['status'] == 'success') {
        _storage.saveToken(response['response']['accessToken']);
        _storage.saveRole(response['response']['role']);
        _storage.saveName(response['response']['username']);
        _storage.saveId(response['response']['idUser']);
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
    EasyLoading.show(
        status: '',
        maskType: EasyLoadingMaskType.black
    );
    try {
      dynamic response = await networkApiService.getApi(ApiEndPoints.listProduct);
      EasyLoading.dismiss();
      if (response['metaData']['code'] == 200) {
        List<Product> productList = (response['response'] as List)
            .map((item) => Product.fromJson(item))
            .toList();
        return productList;
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
}