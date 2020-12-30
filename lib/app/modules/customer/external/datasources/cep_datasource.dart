import 'dart:async';

import 'package:dio/dio.dart';
import 'package:todo_clean_mobx/app/shared/connect/custom_connect_interface.dart';
import 'package:todo_clean_mobx/app/shared/connect/result_model.dart';

import '../../infra/datasources/cep_datasource_interface.dart';
import '../../infra/models/cep_model.dart';

class CepDatasource implements ICepDatasource {
  final ICustomConnect _customConnect;

  CepDatasource(this._customConnect);

  @override
  Future<CepModel> getCep(String cep) async {
    try {
      var client = _customConnect.instance;

      var result = await client.get('https://viacep.com.br/ws/$cep/json');

      return CepModel.fromMap(result.data);
    } on DioError catch (error) {
      if (error.response?.data is ResultModel) throw new ArgumentError(error.response.data.errorText);
      throw error.response;
    }
  }
}
