import 'package:dartz/dartz.dart';
import 'package:testovy_zadanie4/core/error/exception.dart';
import 'package:testovy_zadanie4/core/error/failure.dart';
import 'package:testovy_zadanie4/feature/auth_page/data/data_source/person_remote_data_source.dart';
import 'package:testovy_zadanie4/feature/auth_page/data/models/entities.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/entities/auth_model.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/repositories/auth_repository.dart';

class PersonRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  PersonRepositoryImpl({
    required this.authRemoteDataSource,
   });

  @override
  Future<Either<Failure, AuthEntities>> authUser(String password, String email) async => await _getPersons(() {
        return authRemoteDataSource.authUser(email, password);
      });

  @override
  Future<Either<Failure, AuthEntities>> registerUser(String email, String nickName, String phone, String password) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  Future<Either<Failure, UserAuthModel>> _getPersons(Future<UserAuthModel> Function() getAuth) async {
    try {
      final remotePerson = await getAuth();
      return Right(remotePerson);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
