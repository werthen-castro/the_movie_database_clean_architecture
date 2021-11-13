import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'dio_response.dart';

class DioClientImpl implements DioClient {
  final Dio _dio = Dio();
  final Map<String, dynamic>? header;

  DioClientImpl({this.header}) {
    _dio.options.headers = header;
  }

  @override
  Future<DioResponse> get(String url) async {
    Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (error) {
      return DioResponse(
          statusCode: error.response?.statusCode,
          statusMessage: error.response?.statusMessage);
    }

    return DioResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
