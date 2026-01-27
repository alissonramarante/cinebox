import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/domain/models/favorite_movie.dart';

abstract interface class MoviesRepository {
Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();
Future<Result<Unit>> deleteFavoriteMovie(int movieId);
Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie);
}