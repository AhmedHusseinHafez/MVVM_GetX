import 'package:code_nes_lab_task/core/networking/error_model.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static ErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ErrorModel(
              message:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ErrorModel(message: "Something went wrong");
      }
    } else {
      return ErrorModel(message: "Unknown error occurred");
    }
  }
}

ErrorModel _handleError(dynamic data) {
  return ErrorModel(
    message: data['message'] ?? "Unknown error occurred",
    responseCode: data['code'],
    content: data,
  );
}
