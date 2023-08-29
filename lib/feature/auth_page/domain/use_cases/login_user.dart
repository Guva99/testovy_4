import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testovy_zadanie4/core/error/failure.dart';
import 'package:testovy_zadanie4/core/use_cases/usecase.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/entities/auth_model.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/repositories/auth_repository.dart';

class LoginUser extends UseCase<AuthEntities, PageLoginParams> {
  final AuthRepository authRepository;

  LoginUser(this.authRepository);

  @override
  Future<Either<Failure, AuthEntities>> call(PageLoginParams params) async {
    return await authRepository.authUser(params.pass, params.email);
  }
}

class PageLoginParams extends Equatable {
  final String email;
  final String pass;

  const PageLoginParams({required this.email, required this.pass});

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        pass,
      ];
}
