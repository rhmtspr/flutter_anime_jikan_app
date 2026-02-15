import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.jikan.moe/v4',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Accept': 'application/json'},
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
