import 'package:shared_preferences/shared_preferences.dart';
import 'package:testovy_zadanie4/core/api/api.dart';
import 'package:testovy_zadanie4/core/api/paths.dart';
import 'package:testovy_zadanie4/core/error/exception.dart';
import 'package:testovy_zadanie4/core/service/shared_preference.dart';
import 'package:testovy_zadanie4/core/service/user_secure_storage.dart';
import 'package:testovy_zadanie4/feature/auth_page/data/models/entities.dart';

abstract class AuthRemoteDataSource {
  Future<UserAuthModel> authUser(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserAuthModel> authUser(String email, String password) async {
    try {
      final response = await Api().dio.post<Map<String, dynamic>>(AppApiPath.login, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        final data = UserAuthModel.fromJson(response.data!);
        await _saveToCash(data);
        return data;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> _saveToCash(UserAuthModel data) async {
    final prefs = await SharedPreferences.getInstance();
    SharedPrefsRawProvider(prefs).setString(SharedKeyWords.email, data.user.email);
    SharedPrefsRawProvider(prefs).setString(SharedKeyWords.refreshToken, data.tokens.refreshToken);
    SharedPrefsRawProvider(prefs).setString(SharedKeyWords.accessToken, data.tokens.accessToken);
    SharedPrefsRawProvider(prefs).setString(SharedKeyWords.userNick, data.user.nickname);
  }
}
