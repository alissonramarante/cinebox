import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/data/repositories/reprositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_google_command.g.dart';

@riverpod
class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() => AsyncData(null);

  Future<void> execute() async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signIn();
    switch (result) {
      case Success<Unit>():
        state = const AsyncData(null);
      case Failure<Unit>():
        state = AsyncError(
          'Erro ao realizar login, entre em contato com o suporte.',
          StackTrace.current
        );
    }
  }
}
