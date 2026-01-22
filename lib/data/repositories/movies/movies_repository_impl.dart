import 'dart:developer';

import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/data/exceptions/data_exception.dart';
import 'package:cinebox_app/data/services/movies/movies_service.dart';
import 'package:cinebox_app/domain/models/favorite_movie.dart';
import 'package:dio/dio.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({
    required MoviesService moviesSevices,
  }) : _moviesService = moviesSevices;

  @override
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies() async {
    try {
      final response = await _moviesService.getMyFavoritesMovies();
      final favorites = response
          .map(
            (f) => FavoriteMovie(
              id: f.movieId,
              title: f.title,
              posterPath: f.posterUrl,
              year: f.year,
            ),
          )
          .toList();
      return Success(favorites);
    } on DioException catch (e, s) {
      log('Error ao buscar os filmes favoritos', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Error ao buscar os filmes favoritos'),
      );
    }
  }
}
