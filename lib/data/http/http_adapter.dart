import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokemon_app/data/http/http_client.dart';

class HttpAdapter implements IHttpClient {
  final Dio _client;

  HttpAdapter()
      : _client = Dio(
          BaseOptions(
            baseUrl: dotenv.env['BASE_URL'] ?? '',
          ),
        );

  @override
  Future<Map<String, dynamic>> request({
    required String route,
    String? type,
    Map? body,
    Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});

    final customResponse =
        await _client.get(route, options: Options(headers: defaultHeaders));

    return customResponse.data;
  }
}
