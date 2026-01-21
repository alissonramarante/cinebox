import 'package:cinebox_app/domain/models/movie.dart';

class MoviesCategory {
  
  final List<Movie> popular;
  final List<Movie> topRated;
  final List<Movie> nowPlaying;
  final List<Movie> upcoming;

  MoviesCategory({
    required this.popular,
    required this.topRated,
    required this.nowPlaying,
    required this.upcoming,
  });
}
