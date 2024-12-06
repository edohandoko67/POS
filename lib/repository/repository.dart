import 'package:salesforce/data/network/network_api_service.dart';
import 'package:salesforce/remote/api/api_endpoints.dart';

class Repository {
  NetworkApiService networkApiService = NetworkApiService();

  Future<dynamic> login(var data) {
    dynamic response = networkApiService.postApi(data, ApiEndPoints.login);
    return response;
  }
}