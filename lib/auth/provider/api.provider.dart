import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utils/log.dart';
import '../../utils/storage.dart';
import 'cache.provider.dart';

class HttpClient {
  final String baseUrl;
  final bool enableCache;
  final bool showAlert;
  final Duration duration;
  final Storage _storage = Storage();
  HttpClient({required this.baseUrl, this.enableCache=false, this.showAlert=true, this.duration=const Duration(seconds: 15)});
  late Dio dio = Dio(BaseOptions(baseUrl: baseUrl))
    ..interceptors
        .addAll([
      LogInterceptor(
        requestHeader: false,
        error: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        // logPrint: writeLog,
      ),
      if (enableCache)
        DioCacheInterceptor(
            options: CacheOptions(
              store: HiveCacheStore(AppPathProvider.path),
              policy: CachePolicy.forceCache,
              hitCacheOnErrorExcept: [],
              maxStale: duration,
              priority: CachePriority.high,
            )
        ),
      InterceptorsWrapper(
          onRequest: (options, handler) {
            final String? token = _storage.getToken();
            print('accessToken : $token');
            if(token != null) {
              options.headers["Authorization"] = "Bearer $token";
            }
            return handler.next(options);
          },
          onError: (e, handler) {
            switch (e.type) {
              case DioErrorType.connectTimeout:
                if(showAlert) EasyLoading.dismiss();
                break;
              case DioErrorType.sendTimeout:
                if(showAlert) EasyLoading.dismiss();
                break;
              case DioErrorType.receiveTimeout:
                if(showAlert) EasyLoading.dismiss();
                break;
              case DioErrorType.response:
                if(showAlert) EasyLoading.showError(e.response?.statusMessage??"Server Error");
                break;
              case DioErrorType.cancel:
                if(showAlert) EasyLoading.dismiss();
                break;
              case DioErrorType.other:
                if(showAlert) EasyLoading.showError("Terjadi Kesalahan pada server!");
                break;
            }
            Log.d(e);
            return handler.next(e);
          }
      )
    ]);

  Future<Response<T>> get<T>(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    Response<T> response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress
    );

    return response;
  }

  Future<Response<T>> post<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool showError = true,
    bool useFormData = false
  }) async {
    FormData formData = FormData.fromMap(data);

    Response<T> response = await dio.post(path,
        data: useFormData ? formData : data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress
    );

    return response;
  }

  Future<Response<T>> delete<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool showError = true
  }) async {
    try {
      Response<T> response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      if (showError) {
        EasyLoading.showError('Terjadi kesalahan: ${e.toString()}');
      }
      rethrow;
    }
  }


}