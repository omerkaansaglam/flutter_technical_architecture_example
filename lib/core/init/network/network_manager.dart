import 'package:dio/dio.dart';
import 'package:neyasischallenge/core/init/network/logging.dart';
import 'package:neyasischallenge/env.dart';

class NetworkManager {
  late final Dio _dio;
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    _dio = Dio(BaseOptions(
      baseUrl: Environment.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 10000,
    ))
      ..interceptors.add(Logging());
  }

  // METHOD : GET
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  // METHOD : POST
  Future<Response> postOrPut(
    String uri, {
    String? id,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response;
      if (id != null) {
        response = await _dio.put(
          '$uri$id',
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        response = await _dio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      }
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  // METHOD : PUT
  Future<Response> put(
    String uri,
    String id, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        '$uri$id',
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  // METHOD : DELETE
  Future<Response> delete(
    String uri,
    String id, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        '$uri$id',
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
