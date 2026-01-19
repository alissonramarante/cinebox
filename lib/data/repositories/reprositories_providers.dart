import 'package:cinebox_app/data/repositories/auth/auth_repository.dart';
import 'package:cinebox_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox_app/data/services/service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reprositories_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref){
  return AuthRepositoryImpl(
    localStorageService: ref.read(localStorageServiceProvider), 
    googleSigninService: ref.read(googleSigninServiceProvider),
    authService: ref.read(authServiceProvider),
    );
}