import 'package:dio/dio.dart';

Dio initDio() {
  Dio dio = Dio(
    // This is the base options for Dio client to connect to server
    BaseOptions(
      baseUrl: "129.204.110.90:8080",
      connectTimeout: 3000,
      receiveTimeout: 3000,
      receiveDataWhenStatusError: false,
      sendTimeout: 3000,
    ),
  );
  return dio;
}