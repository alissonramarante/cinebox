import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/data/repositories/reprositories_providers.dart';
import 'package:cinebox_app/domain/models/genre.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_genres_command.g.dart';

@riverpod
class GetGenresCommand extends _$GetGenresCommand {
  @override
  Future<List<Genre>> build() async {
    final result = await ref.read(tmdbRepositoryProvider).getGenres();
    
    return switch (result) {
      Success(:final value) => value,
      Failure() => [],
    };
  }
}
