import 'package:dio/dio.dart';
import 'package:testovy_zadanie4/core/api/paths.dart';

class DioFactory {
  DioFactory._();

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppApiPath.base,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Access-Control-Allow-Credentials': 'true',
        },
      ),
    );
    return dio;
  }
}
