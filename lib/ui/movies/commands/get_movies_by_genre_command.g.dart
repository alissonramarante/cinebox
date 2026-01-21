// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_genre_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMoviesByGenreCommand)
final getMoviesByGenreCommandProvider = GetMoviesByGenreCommandProvider._();

final class GetMoviesByGenreCommandProvider
    extends
        $NotifierProvider<GetMoviesByGenreCommand, AsyncValue<List<Movie>>> {
  GetMoviesByGenreCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByGenreCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByGenreCommandHash();

  @$internal
  @override
  GetMoviesByGenreCommand create() => GetMoviesByGenreCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Movie>>>(value),
    );
  }
}

String _$getMoviesByGenreCommandHash() =>
    r'f82c16a9f8719a6f86609eadf0a2c65825ce7131';

abstract class _$GetMoviesByGenreCommand
    extends $Notifier<AsyncValue<List<Movie>>> {
  AsyncValue<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
