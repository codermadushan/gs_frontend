import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class AppSecureStorage {
  static const instance = AppSecureStorage._internal();
  static FlutterSecureStorage? _storage;

  const AppSecureStorage._internal();

  FlutterSecureStorage _initialize() {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  FlutterSecureStorage get secureStorage {
    if (_storage != null) return _storage!;

    _storage = _initialize();
    return _storage!;
  }

  void dispose() {
    if (_storage == null) return;

    _storage = null;
  }

  Future<void> delete(String key) async {
    await secureStorage.delete(key: key);
  }

  Future<void> write({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await secureStorage.read(key: key);
  }
}
