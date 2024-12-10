import 'dart:convert';
import 'dart:io';

import 'package:salesforce/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json', // Menambahkan header Content-Type
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    print(url);
    print(data);
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
                // Menambahkan header Content-Type
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'error occured while communication with server' +
                response.statusCode.toString());
    }
  }
}
