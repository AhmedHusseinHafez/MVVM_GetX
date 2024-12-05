import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio createAndSetupDio() {
    Duration timeOut = const Duration(seconds: 6);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

      _addDioInterceptor();
      _retryInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _retryInterceptor() {
    if (dio != null) {
      dio!.interceptors.add(
        RetryInterceptor(
          dio: dio!,
          logPrint: print, // specify log function (optional)
          retries: 2, // retry count (optional)
          retryDelays: const [
            // set delays between retries (optional)
            Duration(seconds: 1), // wait 1 sec before the first retry
            Duration(seconds: 2), // wait 2 sec before the second retry
          ],
        ),
      );
    }
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        responseBody: true,
        request: true,
      ),
    );
  }
}
