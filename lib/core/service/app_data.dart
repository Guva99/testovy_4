
class AuthAppData {
  static final AuthAppData _authAppData = AuthAppData._internal();

  bool isUserAuth = false;
  String accessToken = '';

  factory AuthAppData() => _authAppData;


  AuthAppData._internal();
}

final appData = AuthAppData();
