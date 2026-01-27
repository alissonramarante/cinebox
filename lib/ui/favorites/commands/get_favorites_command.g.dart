// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorites_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetFavoritesCommand)
final getFavoritesCommandProvider = GetFavoritesCommandProvider._();

final class GetFavoritesCommandProvider
    extends
        $NotifierProvider<
          GetFavoritesCommand,
          AsyncValue<List<FavoriteMovie>>
        > {
  GetFavoritesCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFavoritesCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFavoritesCommandHash();

  @$internal
  @override
  GetFavoritesCommand create() => GetFavoritesCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<FavoriteMovie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<FavoriteMovie>>>(
        value,
      ),
    );
  }
}

String _$getFavoritesCommandHash() =>
    r'adb8908f70b538d0e77eeb254ecdffcd831155e9';

abstract class _$GetFavoritesCommand
    extends $Notifier<AsyncValue<List<FavoriteMovie>>> {
  AsyncValue<List<FavoriteMovie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<FavoriteMovie>>,
              AsyncValue<List<FavoriteMovie>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FavoriteMovie>>,
                AsyncValue<List<FavoriteMovie>>
              >,
              AsyncValue<List<FavoriteMovie>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
