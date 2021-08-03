abstract class Cache {
  Future<dynamic> get(String key);
  Future<void> save({required String key, required dynamic value});
}
