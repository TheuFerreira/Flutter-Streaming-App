import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/core/fetch/fetch_response.dart';
import 'package:streaming_app/core/preferences/preferences.dart';
import 'package:streaming_app/infra/models/token_model.dart';

abstract class Fetch {
  Future<FetchResponse<T>> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  });

  Future<FetchResponse<T>> get<T>({required String path});
}

class FetchImpl implements Fetch {
  late Dio _dio;

  FetchImpl(String baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final hasNoBearer = options.headers.containsKey('no_bearer');
          if (hasNoBearer) {
            options.headers.remove('no_bearer');
            handler.next(options);
            return;
          }

          final preferences = Preferences();
          final json = await preferences.get<String>('token');
          final map = jsonDecode(json);
          final tokenModel = TokenModel.fromMap(map);

          options.headers.addAll({
            'Authorization': 'BEARER ${tokenModel.accessToken}',
          });
          handler.next(options);
        },
      ),
    );
  }

  @override
  Future<FetchResponse<T>> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      final fetchResponse = FetchResponse(
        statusCode: response.statusCode,
        data: response.data as T,
      );
      return fetchResponse;
    } on DioException catch (ex) {
      _catchErrors(ex);
      throw FetchUnknownException();
    }
  }

  @override
  Future<FetchResponse<T>> get<T>({required String path}) async {
    try {
      final response = await _dio.get(path);
      final fetchResponse = FetchResponse(
        statusCode: response.statusCode,
        data: response.data as T,
      );
      return fetchResponse;
    } on DioException catch (ex) {
      _catchErrors(ex);
      throw FetchUnknownException();
    }
  }

  _catchErrors(DioException ex) {
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
        } else if (response.statusCode == 404) {
          throw FetchNotFoundException();
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
