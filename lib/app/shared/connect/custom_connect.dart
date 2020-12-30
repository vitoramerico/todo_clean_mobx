import 'package:dio/dio.dart';

import 'custom_connect_interface.dart';
import 'interceptors/custom_interceptor.dart';

class CustomConnect implements ICustomConnect {
  final Dio _dio;

  CustomConnect(this._dio) {
    _dio.options.baseUrl = 'http://192.168.1.220:5000';
    _dio.interceptors.add(CustomInterceptor());
  }

  @override
  Dio get instance => _dio;
}
