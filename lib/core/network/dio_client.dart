import 'dart:io';

import 'package:dio/dio.dart';

import 'dio_exceptions.dart';

class DioClient {
  late final Dio _dio;

  // DioClient constructor
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '',
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: "application/json"
        },
      ),
    );
  }
  // get endpoint
  Future<Response> get(String endpoint,
      [Map<String, dynamic>? queryParameters]) async {
    Response response;

    try {
      response = await _dio.get(endpoint, queryParameters: queryParameters);

      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  // get endpoint
  Future<Response> post(String endpoint,
      [Map<String, dynamic>? queryParameters]) async {
    Response response;

    try {
      response = await _dio.get(endpoint, queryParameters: queryParameters);

      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
