import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/error/exception.dart';
import 'package:flutter_pokemon/shared/helper/config.dart';
import 'package:flutter_pokemon/shared/helper/shared_pref.dart';

class ApiClient {
  static final Dio _dio = Dio();

  // Configure global options and interceptors
  static Dio get dio {
    _dio.options.baseUrl = FlavorConfig.instance.values.baseUrl!;
    _dio.options.connectTimeout = 5000; // 5 seconds
    _dio.options.receiveTimeout = 3000; // 3 seconds

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) async {
        debugPrint('Dio onRequest: ${options.toString()}');

        // Add authentication tokens
        String? token = await getTokenJwt();
        options.headers['Authorization'] = '$token';

        return handler.next(options);
      },
      onResponse: (
        Response<dynamic> response,
        ResponseInterceptorHandler handler,
      ) {
        // Log response details or perform other actions
        debugPrint('Dio onResponse: ${response.statusCode}');
        debugPrint('Body: ${response.data}');

        return handler.next(response);
      },
      onError: (DioError e, ErrorInterceptorHandler handler) async {
        debugPrint('Dio onError: ${e.message}');

        // Handle specific error scenarios
        if (e.type == DioErrorType.response && e.response?.statusCode == 401) {
          // Handle unauthorized errors
          Options options = Options(
            method: e.requestOptions.method,
            headers: e.requestOptions.headers,
          );
          return handler.resolve(await dio.request(
            e.requestOptions.path,
            options: options,
          ));
        }

        //TODO:add new handler for other type of error code

        return handler.next(e);
      },
    ));

    return _dio;
  }

  // HANDLE HTTP API GET REQUEST
  Future<Response> dioGet(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
  }) async {
    try {
      await insertAdditionalHeaders(header);
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
    } on Exception catch (e) {
      throw ApiException.handleException(e, endpoint);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // HANDLE HTTP API POST REQUEST
  Future<Response> dioPost(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? header,
  }) async {
    try {
      await insertAdditionalHeaders(header);
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on Exception catch (e) {
      throw ApiException.handleException(e, endpoint);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // HANDLE HTTP API PUT REQUEST
  Future<Response> dioPut(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? header,
  }) async {
    try {
      await insertAdditionalHeaders(header);
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on Exception catch (e) {
      throw ApiException.handleException(e, endpoint);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // HANDLE HTTP API DELETE REQUEST
  Future<Response> dioDelete(
    String endpoint,
    Map<String, dynamic>? header,
  ) async {
    try {
      await insertAdditionalHeaders(header);
      final response = await _dio.delete(endpoint);
      return response;
    } on Exception catch (e) {
      throw ApiException.handleException(e, endpoint);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // HANDLE HTTP API DOWNLOAD REQUEST
  Future<Response<dynamic>> dioDownload(
    String url, {
    Map<String, String>? header,
    String? path,
  }) async {
    try {
      await insertAdditionalHeaders(header);
      final response = await dio.get(
        Uri.encodeFull(url),
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );
      debugPrint("Download Data Res: ${response.data}");
      return response;
    } on Exception catch (e) {
      debugPrint("downloadData error: $e");
      throw ApiException.handleException(e, url);
    }
  }

  //HANDLE ADDITIONAL HEADER REQUIREMENT
  Future<void> insertAdditionalHeaders(Map<String, dynamic>? header) async {
    if (header != null) {
      _dio.options.headers.addAll(header);
    }
  }

  //HANDLE ERROR REQUEST
  dynamic _handleError(error) {
    debugPrint('API Error: $error');
    throw Exception('Failed to perform the request.');
  }
}
