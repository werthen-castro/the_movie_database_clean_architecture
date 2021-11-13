import 'dio_response.dart';

abstract class DioClient {
  Future<DioResponse> get(String url);
}
