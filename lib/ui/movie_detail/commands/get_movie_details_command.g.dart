// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_details_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMovieDetailsCommand)
final getMovieDetailsCommandProvider = GetMovieDetailsCommandProvider._();

final class GetMovieDetailsCommandProvider
    extends
        $NotifierProvider<GetMovieDetailsCommand, AsyncValue<MovieDetail?>> {
  GetMovieDetailsCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieDetailsCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieDetailsCommandHash();

  @$internal
  @override
  GetMovieDetailsCommand create() => GetMovieDetailsCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<MovieDetail?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<MovieDetail?>>(value),
    );
  }
}

String _$getMovieDetailsCommandHash() =>
    r'445f3f5bb84a3628740e47cffad942919104dd6a';

abstract class _$GetMovieDetailsCommand
    extends $Notifier<AsyncValue<MovieDetail?>> {
  AsyncValue<MovieDetail?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<MovieDetail?>, AsyncValue<MovieDetail?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieDetail?>, AsyncValue<MovieDetail?>>,
              AsyncValue<MovieDetail?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
