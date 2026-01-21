import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app/domain/models/movie.dart';

class GetMoviesByGenreUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByGenreUsecase({
    required TmdbRepository tmdbRepository,
    })
    : _tmdbRepository = tmdbRepository;

  Future<Result<List<Movie>>> execute({required int genreId}) async {
    final moviesByGenreResult = await _tmdbRepository.getMoviesByGenres(
      genreId: genreId,
    );
    return moviesByGenreResult;
  }
}
