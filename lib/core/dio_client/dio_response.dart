class DioResponse {
  final dynamic data;
  final int? statusCode;
  final String? statusMessage;
  final bool timeout;

  DioResponse(
      {this.data, this.statusCode, this.statusMessage, this.timeout = false});
}
