import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _secureStorage = FlutterSecureStorage();
  static const _tokenAccess = 'token_access';
  static const _tokenRefresh = 'token_refresh';

  static Future setUserAccessToken(String tokenAccess) async =>
      _secureStorage.write(key: _tokenAccess, value: tokenAccess);

  static Future<String?> getUserAccessToken() async =>
      _secureStorage.read(key: _tokenAccess);

  static Future setUserRefreshToken(String tokenRefresh) async =>
      _secureStorage.write(key: _tokenRefresh, value: tokenRefresh);

  static Future<String?> getUserRefreshToken() async =>
      _secureStorage.read(key: _tokenRefresh);
}
