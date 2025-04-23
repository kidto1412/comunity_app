import 'dart:developer';

import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  final Dio dio;
  final StorageService? storageService;

  NetworkClient({required this.dio, this.storageService}) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storageService?.read("token");
        log('🔥 Token from storage: $token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.get(url,
        queryParameters: queryParameters, options: options);
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
  }) async {
    return await dio.post(url, data: data, options: options);
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
  }) async {
    return await dio.put(url, data: data, options: options);
  }

  Future<Response> patch(
    String url, {
    dynamic data,
    Options? options,
  }) async {
    return await dio.patch(url, data: data, options: options);
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
  }) async {
    return await dio.delete(url, data: data, options: options);
  }

  Future<Response> downloadBlob(
    String url,
    String savePath, {
    ProgressCallback? onReceiveProgress,
  }) async {
    return await dio.download(
      url,
      savePath,
      onReceiveProgress: onReceiveProgress,
      options: Options(responseType: ResponseType.bytes),
    );
  }
}
