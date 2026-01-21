import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app/domain/models/movie.dart';
import 'package:cinebox_app/domain/models/movies_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByCategoryUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<MoviesCategory>> execute() async {
    final results = await Future.wait([
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getPopularMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getUpComingMovies(),
    ]);

    if (results case [
      Success<List<Movie>>(value: final popular),
      Success<List<Movie>>(value: final topRated),
      Success<List<Movie>>(value: final nowPlaying),
      Success<List<Movie>>(value: final upcoming),
    ]) {
      return Success(
        MoviesCategory(
          popular: popular,
          topRated: topRated,
          nowPlaying: nowPlaying,
          upcoming: upcoming,
        ),
      );
    }

    return Failure(Exception('Erro ao buscar categorias de filmes'));
  }
}
