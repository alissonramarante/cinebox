// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_by_name_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchMoviesByName)
final searchMoviesByNameProvider = SearchMoviesByNameProvider._();

final class SearchMoviesByNameProvider
    extends $NotifierProvider<SearchMoviesByName, AsyncValue<List<Movie>>> {
  SearchMoviesByNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchMoviesByNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchMoviesByNameHash();

  @$internal
  @override
  SearchMoviesByName create() => SearchMoviesByName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Movie>>>(value),
    );
  }
}

String _$searchMoviesByNameHash() =>
    r'020bf22bd6e6b2223d7cd49c1a1ac6ea38b7d2ca';

abstract class _$SearchMoviesByName extends $Notifier<AsyncValue<List<Movie>>> {
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
