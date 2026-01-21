// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_category_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMoviesByCategoryCommand)
final getMoviesByCategoryCommandProvider =
    GetMoviesByCategoryCommandProvider._();

final class GetMoviesByCategoryCommandProvider
    extends
        $NotifierProvider<
          GetMoviesByCategoryCommand,
          AsyncValue<MoviesCategory?>
        > {
  GetMoviesByCategoryCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByCategoryCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByCategoryCommandHash();

  @$internal
  @override
  GetMoviesByCategoryCommand create() => GetMoviesByCategoryCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<MoviesCategory?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<MoviesCategory?>>(value),
    );
  }
}

String _$getMoviesByCategoryCommandHash() =>
    r'93c9c2c630bf410890122230109f45c61b4cc52d';

abstract class _$GetMoviesByCategoryCommand
    extends $Notifier<AsyncValue<MoviesCategory?>> {
  AsyncValue<MoviesCategory?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<MoviesCategory?>, AsyncValue<MoviesCategory?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<MoviesCategory?>,
                AsyncValue<MoviesCategory?>
              >,
              AsyncValue<MoviesCategory?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
