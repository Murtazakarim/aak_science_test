abstract class HttpClient {
  Future<dynamic> makeRequest(
    HttpRequest request, {
    Function(int bytesSent, int totalBytes)? onSendProgress,
  });
}

class HttpRequest {
  final String endpoint;
  final String method;
  final dynamic data;
  final Map<String, dynamic> headers;

  HttpRequest(
      {required this.endpoint,
      required this.method,
      this.data,
      this.headers = const {}});
}
