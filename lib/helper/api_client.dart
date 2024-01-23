import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiClient {
  final Dio _dio = Dio();

  // Base API URL
  final String baseUrl;

  ApiClient({required this.baseUrl}) {
    // Configure Dio instance
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
  }

  Future<Response> dioGet(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> dioPost(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> dioPut(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> dioDelete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(error) {
    // You can customize error handling based on your requirements
    debugPrint('API Error: $error');
    throw Exception('Failed to perform the request.');
  }
}
