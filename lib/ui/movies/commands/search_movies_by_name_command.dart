import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/domain/models/movie.dart';
import 'package:cinebox_app/domain/usecases/usecases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_by_name_command.g.dart';

@riverpod
class SearchMoviesByName extends _$SearchMoviesByName {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();

  Future<void> execute(String name) async {
    state = AsyncLoading();
    final searchMovieUC = ref.read(getMoviesByNameUsecaseProvider);
    final result = await searchMovieUC.execute(name: name);

    state = switch(result){
      Success(:final value) => AsyncData(value),
      Failure() => AsyncError(
        Exception('Erro ao buscar filmes'), StackTrace.current),
    };
  }
}