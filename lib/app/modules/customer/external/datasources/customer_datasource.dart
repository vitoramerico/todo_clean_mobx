import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../shared/connect/custom_connect_interface.dart';
import '../../../../shared/connect/result_model.dart';
import '../../infra/datasources/customer_datasource_interface.dart';
import '../../infra/models/customer_model.dart';

class CustomerDatasource implements ICustomerDatasource {
  static const String URL_BASE = '/api/v1/customers';

  final ICustomConnect _customConnect;

  CustomerDatasource(this._customConnect);

  @override
  Future<CustomerModel> getById(String id) async {
    try {
      var client = _customConnect.instance;

      var parameters = {'id': id};

      var result = await client.get(
        '$URL_BASE/get',
        queryParameters: parameters,
      );

      var resultData = ResultModel.fromMap(result.data);

      return CustomerModel.fromMap(resultData.data);
    } on DioError catch (error) {
      if (error.response?.data is ResultModel) throw new ArgumentError(error.response.data.errorText);
      throw error.response;
    }
  }

  @override
  Future<List<CustomerModel>> getAll(int page, int pageSize) async {
    try {
      var client = _customConnect.instance;

      var parameters = {
        'page': page,
        'pageSize': pageSize,
      };

      var result = await client.get(
        '$URL_BASE/getAll',
        queryParameters: parameters,
      );

      var resultData = ResultModel.fromMap(result.data);

      List<dynamic> data = resultData.data;

      return data.map((v) => CustomerModel.fromMap(v)).toList();
    } on DioError catch (error) {
      if (error.response?.data is ResultModel) throw new ArgumentError(error.response.data.errorText);
      throw error.response;
    }
  }

  @override
  Future<String> save(CustomerModel customerModel) async {
    try {
      var client = _customConnect.instance;

      var result = await client.post(
        '$URL_BASE/add',
        data: customerModel.toJson(),
      );

      var resultData = ResultModel.fromMap(result.data);

      return resultData.data['id'];
    } on DioError catch (error) {
      if (error.response?.data is ResultModel) throw new ArgumentError(error.response.data.errorText);
      throw error.response;
    }
  }

  @override
  Future<String> update(CustomerModel customerModel) async {
    try {
      var client = _customConnect.instance;

      var result = await client.post(
        '$URL_BASE/edit',
        data: customerModel.toJson(),
      );

      var resultData = ResultModel.fromMap(result.data);

      return resultData.data['id'];
    } on DioError catch (error) {
      if (error.response?.data is ResultModel) throw new ArgumentError(error.response.data.errorText);
      throw error.response;
    }
  }
}
