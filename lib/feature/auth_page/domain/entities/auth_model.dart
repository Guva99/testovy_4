import 'package:equatable/equatable.dart';
import 'package:testovy_zadanie4/feature/auth_page/data/models/entities.dart';

class AuthEntities extends Equatable {
  const AuthEntities({
    required this.user,
    required this.tokens,
  });

  final UserModel user;
  final TokenModel tokens;

  @override
  List<Object?> get props => [
        user,
        tokens,
      ];
}

class TokenEntity {
  final String accessToken;
  final String refreshToken;

  TokenEntity({required this.accessToken, required this.refreshToken});
}

class UserEntity {
  final int id;
  final String nickname;
  final String email;

  const UserEntity({
    required this.id,
    required this.nickname,
    required this.email,
  });
}
