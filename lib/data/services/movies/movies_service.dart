import 'package:cinebox_app/data/models/favorite_movie_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio, {String baseUrl}) = _MoviesService;

  @GET('/favorite')
  Future<List<FavoriteMovieResponse>> getMyFavoritesMovies();

}