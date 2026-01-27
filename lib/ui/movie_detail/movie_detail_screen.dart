import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox_app/ui/core/themes/colors.dart';
import 'package:cinebox_app/ui/core/themes/text_style.dart';
import 'package:cinebox_app/ui/core/widgets/loader_messages.dart';
import 'package:cinebox_app/ui/movie_detail/commands/get_movie_details_command.dart';
import 'package:cinebox_app/ui/movie_detail/movie_detail_view_model.dart';
import 'package:cinebox_app/ui/movie_detail/widget/cast_box.dart';
import 'package:cinebox_app/ui/movie_detail/widget/movie_trailler.dart';
import 'package:cinebox_app/ui/movie_detail/widget/rating_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen>
    with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieId = ModalRoute.of(context)?.settings.arguments as int?;

      if (movieId == null) {
        showErrorSnackbar('Filme não encontrado');
        Navigator.pop(context);
        return;
      }
      ref.read(movieDetailViewModelProvider).fetchMovieDetails(movieId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetail = ref.watch(getMovieDetailsCommandProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe do Filme'),
      ),
      body: movieDetail.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stacktrace) => Center(
          child: Text('Erro ao carregar detalhes do filme'),
        ),
        data: (data) {
          if (data == null) {
            return Center(
              child: Text('Filme não encontrado'),
            );
          }

          final hoursRuntime = data.runtime ~/ 60;
          final minutesRuntime = data.runtime % 60;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                SizedBox(
                  height: 278,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CachedNetworkImage(
                          imageUrl: data.images[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            height: 160,
                            color: AppColors.lightGrey,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        data.title,
                        style: AppTextStyle.titleLarge,
                      ),
                      RatingStars(
                        starCount: 5,
                        starColor: AppColors.yellow,
                        starSize: 14,
                        valueLabelVisibility: false,
                        value: data.voteAverage / 2,
                      ),
                      Text(
                        data.genres.map((g) => g.name).join(', '),
                        style: AppTextStyle.lightGreyRegular,
                      ),
                      Text(
                        '${DateTime.parse(data.releaseDate).year} | ${hoursRuntime}h$minutesRuntime ',
                        style: AppTextStyle.regularSmall,
                      ),
                      Text(
                        data.overview,
                        style: AppTextStyle.regularSmall,
                      ),
                      CastBox(movieDetail: data),
                      if (data.videos.isNotEmpty)
                        MovieTrailler(videoId: data.videos.first),
                      const SizedBox(
                        height: 30,
                      ),
                      RatingPanel(
                        voteAverage: data.voteAverage,
                        voteCount: data.voteCount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
