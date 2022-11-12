import 'package:flavored_app_demo/constants/urls.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flavored_app_demo/helpers/exception.dart';
import 'package:flavored_app_demo/helpers/logger.dart';
import 'package:http/http.dart' as http;

import 'response_data.dart';

class ApiProvider {
  ApiProvider({String? baseUrl}) {
    _baseUrl = baseUrl ?? AppUrls.baseUrl;
  }

  String? _baseUrl;

  final http.Client _client = http.Client();

  Future<dynamic> _catchAsyncApiError({
    required String baseUrl,
    required String endPoint,
    required String method,
    required String feature,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    AppLogger.log('$feature Request');

    var url = Uri.parse(baseUrl + endPoint);

    if (queryParams != null && queryParams.isNotEmpty) {
      url = url.replace(queryParameters: queryParams);
    }

    AppLogger.log('URL: $url');

    var headersWithContentType = {
      "content-type": "application/json",
    };

    if (headers != null) {
      headersWithContentType.addAll(headers);
    }

    try {
      switch (method) {
        case "GET":
          var response = await _client.get(
            url,
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppLogger.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppLogger.log('$feature Request Error', tag: 'error');
            AppLogger.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} ${response.body}');
            return ResponseData(data: decodedData, isSuccessful: false);
          }

        case "POST":
          var response = await _client.post(
            url,
            body: jsonEncode(body),
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppLogger.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppLogger.log('$feature Request Error', tag: 'error');
            AppLogger.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} ${response.body}');
            return ResponseData(data: decodedData, isSuccessful: false);
          }

        case "PUT":
          var response = await _client.put(
            url,
            body: jsonEncode(body),
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppLogger.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppLogger.log('$feature Request Error', tag: 'error');
            AppLogger.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} ${response.body}');
            return ResponseData(data: decodedData, isSuccessful: false);
          }

        case "DELETE":
          var response = await _client.delete(
            url,
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppLogger.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppLogger.log('$feature Request Error', tag: 'error');
            AppLogger.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} $decodedData');
            return ResponseData(data: decodedData, isSuccessful: false);
          }
      }
    } on SocketException {
      AppLogger.log('$feature Request Error', tag: 'error');
      AppLogger.log('Error: No Internet Connection', tag: 'error');
      throw AppException('No Internet Connection');
    } on TimeoutException {
      AppLogger.log('$feature Request Error', tag: 'error');
      AppLogger.log('Error: Request Timeout', tag: 'error');
      throw AppException('Request Timeout');
    } on FormatException catch (e) {
      AppLogger.log('$feature Request Error', tag: 'error');
      AppLogger.log('Format Exception: $e', tag: 'error');
      throw AppException('Format Exception: $e');
    } catch (exc) {
      AppLogger.log('$feature Request Error', tag: 'error');
      AppLogger.log('Error: $exc', tag: 'error');
      throw AppException(exc.toString());
    }
  }

  Future<ResponseData> getTodos() async {
    final response = await _catchAsyncApiError(
      baseUrl: _baseUrl!,
      endPoint: AppUrls.getTodos,
      method: 'GET',
      feature: 'Get Todos',
    );

    return response;
  }
}
