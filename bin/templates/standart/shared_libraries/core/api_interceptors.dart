import 'dart:io';

apiInterceptors(Directory dir) {
  String template = """
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptors extends Interceptor {
  final SharedPreferences sharedPreferences;

  ApiInterceptors({required this.sharedPreferences});

  Map<String, dynamic> _defaultHeader() {
    String? authorizationToken = sharedPreferences.getString(
      AppConstants.cachedKey.tokenKey,
    );
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';
    headers['Authorization'] =
        authorizationToken != null ? 'Bearer \$authorizationToken' : "";
    return headers;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      options.headers.addAll(_defaultHeader());

      final requestBody =
          const JsonEncoder.withIndent('  ').convert(options.data);
      final queryParameters =
          const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : \${options.uri}\\n'
        '----------------------------------------------------------------------\\n'
        'Header: \${options.headers}\\n'
        '----------------------------------------------------------------------\\n'
        'Request Body: \$requestBody\\n'
        '----------------------------------------------------------------------\\n'
        'Request Query Parameters: \$queryParameters\\n'
        '----------------------------------------------------------------------\\n'
        'Method: \${options.method}\\n',
      );
      return handler.next(options);
    } catch (e) {
      final queryParameters =
          const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : \${options.uri}\\n'
        '----------------------------------------------------------------------\\n'
        'Header: \${options.headers}\\n'
        '----------------------------------------------------------------------\\n'
        'Request Body: cannot read request body\\n'
        '----------------------------------------------------------------------\\n'
        'Request Query Parameters: \$queryParameters\\n'
        '----------------------------------------------------------------------\\n'
        'Method: \${options.method}\\n',
      );
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final prettyString =
        const JsonEncoder.withIndent('  ').convert(response.data);
    log(
      'Status Code: \${response.statusCode}\\n'
      '——————————————————————————————————————————————————————————————————————\\n'
      'Response : \$prettyString\\n',
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Dio Error : \$err, \${err.response}');
    return handler.next(err);
  }
}


""";

  var file = File('${dir.path}/api_interceptors.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
