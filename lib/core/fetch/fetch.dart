import 'package:dio/dio.dart';
import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/core/fetch/fetch_response.dart';

class Fetch {
  late Dio _dio;

  Fetch() {
    _dio = Dio(
      BaseOptions(baseUrl: 'http://192.168.0.162:5028'),
    );
  }

  Future<FetchResponse<T>> post<T>({required String path, Object? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      final fetchResponse = FetchResponse(
        statusCode: response.statusCode,
        data: response.data as T,
      );
      return fetchResponse;
    } on DioException catch (ex) {
      DioExceptionType type = ex.type;
      switch (type) {
        case DioExceptionType.connectionTimeout:
          throw FetchUnknownException();
        case DioExceptionType.sendTimeout:
          throw FetchUnknownException();
        case DioExceptionType.receiveTimeout:
          throw FetchUnknownException();
        case DioExceptionType.badCertificate:
          throw FetchUnknownException();
        case DioExceptionType.badResponse:
          final response = ex.response;
          if (response == null) {
            throw FetchUnknownException();
          }

          if (response.statusCode == 400) {
            throw FetchBadRequestException();
          }

          throw FetchUnknownException();
        case DioExceptionType.cancel:
          throw FetchUnknownException();
        case DioExceptionType.connectionError:
          throw FetchUnknownException();
        case DioExceptionType.unknown:
          throw FetchUnknownException();
      }
    }
  }
}
