import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:salesforce/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:salesforce/utils/storage.dart';
import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  final Storage _storage = Storage();
  @override
  Future<dynamic> getApi(String url) async {
    print("Request URL: $url");
    final String? token = _storage.getToken();
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);  // Handle server response based on status code
    } on SocketException catch (e) {
      // Handle network errors (e.g., no internet connection)
      print("SocketException: $e");
      throw InternetException("No internet connection.");
    } on TimeoutException catch (e) {
      // Handle request timeout
      print("TimeoutException: $e");
      throw TimeoutException("Request timed out.");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    print("Request URL: $url");
    print("Request Data: $data");
    final String? token = _storage.getToken();
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
          headers: {'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'},
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

  @override
  Future<dynamic> deletetApi(var data, String url) async {
    print("Request URL: $url");
    print("Request Data: $data");
    final String? token = _storage.getToken();
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
          headers: {'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'},
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
      // Successfully fetched data
        return jsonDecode(response.body);
      case 400:
      // Bad request (client error)
        throw BadRequestException("Bad request. Please check the request format.");
      case 401:
      // Unauthorized (client error)
        throw UnauthorizedException("Unauthorized access. Please check your credentials.");
      case 403:
      // Forbidden (client error)
        throw ForbiddenException("Forbidden. You do not have permission to access this resource.");
      case 404:
      // Not found (client error)
        throw NotFoundException("The requested resource was not found.");
      case 500:
      // Internal server error (server error)
        throw ServerException("Internal server error. Please try again later.");
      default:
      // Other errors
        throw Exception("Unexpected error occurred: ${response.statusCode}");
    }
  }
}
