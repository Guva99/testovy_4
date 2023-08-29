import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testovy_zadanie4/feature/auth_page/data/data_source/person_remote_data_source.dart';
import 'package:testovy_zadanie4/feature/auth_page/data/repositories/auth_repository_impl.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/repositories/auth_repository.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/use_cases/login_user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authRemoteDataSource = AuthRemoteDataSourceImpl();

  return PersonRepositoryImpl(
    authRemoteDataSource: authRemoteDataSource,
  );
});

final loginUserUseCaseProvider = Provider<LoginUser>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LoginUser(authRepository);
});
