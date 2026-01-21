import 'package:cinebox_app/data/repositories/reprositories_providers.dart';
import 'package:cinebox_app/domain/usecases/get_movies_by_category_usecase.dart';
import 'package:cinebox_app/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases_provider.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref){
  return GetMoviesByCategoryUsecase(
    tmdbRepository: ref.read(tmdbRepositoryProvider)
    );
}

@riverpod
GetMoviesByGenreUsecase getMoviesByGenreUsecase(Ref ref) =>
  GetMoviesByGenreUsecase(tmdbRepository: ref.read(tmdbRepositoryProvider));