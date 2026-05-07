import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import 'api_service.dart';

final _dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ),
  );

  return dio;
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(_dioProvider);
  return ApiService(dio);
});