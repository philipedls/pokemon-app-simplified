abstract class IHttpClient {
  Future<Map<String, dynamic>> request({
    required String route,
    String type,
    Map body,
    Map headers,
  });
}
