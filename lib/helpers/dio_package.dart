import 'package:dio/dio.dart';


Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "https://eslampharmacy.com/api/";
  dio.options.connectTimeout = Duration(seconds: 10);
  // dio.options.baseUrl = Constants.baseUrl;
  // dio.options.connectTimeout = 20000;

  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestBody: true,
      requestHeader: true,
    ),
  );
  return dio;
}