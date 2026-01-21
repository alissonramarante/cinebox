import 'package:flutter/widgets.dart';


class Movie {

  final int id;
  final String title;
  final String overview;
  final List<int> genreIds;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseData;
  final bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    this.posterPath,
    this.backdropPath,
    this.releaseData,
    this.isFavorite = false,
  });

  

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    List<int>? genreIds,
    ValueGetter<String?>? posterPath,
    ValueGetter<String?>? backdropPath,
    double? voteAverage,
    ValueGetter<String?>? releaseData,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      genreIds: genreIds ?? this.genreIds,
      posterPath: posterPath != null ? posterPath() : this.posterPath,
      backdropPath: backdropPath != null ? backdropPath() : this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseData: releaseData != null ? releaseData() : this.releaseData,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
