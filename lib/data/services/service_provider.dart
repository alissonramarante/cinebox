import 'package:cinebox_app/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox_app/data/services/google_signin/google_signin_service_impl.dart';
import 'package:cinebox_app/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox_app/data/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_provider.g.dart';

@riverpod
GoogleSignInService googleSigninService( Ref ref) {
  return GoogleSigninServiceImpl();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref){
  return LocalStorageServiceImpl(
    flutterSecureStorage: FlutterSecureStorage(),
  );
}