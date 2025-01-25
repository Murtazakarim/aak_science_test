import 'package:dio/dio.dart';
import '/api_service/http_client.dart';

class ApiService implements HttpClient {
  final Dio _dio;

  ApiService(this._dio);

  @override
  Future<dynamic> makeRequest(
    HttpRequest request, {
    Function(int bytesSent, int totalBytes)? onSendProgress,
  }) async {
    try {
      final response = await _dio.request(
        request.endpoint,
        data: request.data,
        options: Options(
          method: request.method,
          headers: {
            ...request.headers,
            'Content-Type': 'application/json',
           // 'Authorization': await bearerToken(),
          },
        ),
      );
      return response;
    } catch (exception) {
      if (exception is DioException) {
        if (exception.response?.data != null) {
          final errorMessage =
              checkError(exception) ?? exception.response?.data;
          throw CustomError(
            message: errorMessage,
          );
        }
      } else {
        const errorMessage = 'Unknown error occurred';
        throw CustomError(message: errorMessage);
      }
    }
  }
}

String? checkError(var data) {
  try {
    final errorMessage = data.response!.data['message'];
    return errorMessage;
  } catch (e) {
    return null;
  }
}

/*//TODO: Handle this using Session later on.
Future<String> bearerToken() async {
  final box = GetStorage();
  final token = await box.read('token');
  print('token::: $token');
  final headers = '$token';
  return headers;
}*/

class CustomError implements Exception {
  final String message;
  // final int code;
  CustomError({required this.message});

  @override
  String toString() {
    return message;
  }

  factory CustomError.fromJson(Map<String, dynamic> json) =>
      CustomError(message: json["message"]);
}
