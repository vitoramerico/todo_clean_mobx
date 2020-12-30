import 'package:dio/dio.dart';
import 'package:todo_clean_mobx/app/shared/connect/result_model.dart';

class CustomInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    return options;
  }

  @override
  onResponse(Response response) async {
    return response;
  }

  @override
  onError(DioError e) async {
    print('DioError ${e.request?.headers}');
    print('DioError ${e.response}');
    print('DioError ${e.error}');

    if (e.response.statusCode == 400)
      return DioError(
        request: e.request,
        response: Response(data: ResultModel.fromMap(e.response.data)),
        type: e.type,
      );

    return e;
  }
}
