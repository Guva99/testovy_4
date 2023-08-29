import 'package:dartz/dartz.dart';
import 'package:testovy_zadanie4/core/error/failure.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/entities/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntities>> authUser(String password, String email);

  Future<Either<Failure, AuthEntities>> registerUser(
    String email,
    String nickName,
    String phone,
    String password,
  );
}
