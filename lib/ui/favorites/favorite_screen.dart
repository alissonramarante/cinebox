import 'package:cinebox_app/domain/models/favorite_movie.dart';
import 'package:cinebox_app/ui/core/widgets/loader_messages.dart';
import 'package:cinebox_app/ui/core/widgets/movie_card.dart';
import 'package:cinebox_app/ui/favorites/commands/get_favorites_command.dart';
import 'package:cinebox_app/ui/favorites/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen>
    with LoaderAndMessage {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesViewModelProvider).fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(getFavoritesCommandProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Favoritos'),
      ),
      body: favoritesMovies.when(
        loading: () => Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stackTrace) => Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Center(
            child: Text('Erro ao buscar filmes favoritos'),
          ),
        ),
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text('Ops! nenhum filme favoritado'),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 148,
                    mainAxisExtent: 268,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final FavoriteMovie(
                        :id,
                        :title,
                        :year,
                        posterPath: imageUrl,
                      ) = data[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: MovieCard(
                          key: UniqueKey(),
                          id: id,
                          title: title,
                          year: year,
                          imageUrl: imageUrl,
                          isFavorite: true,
                          onFavoriteTap: () async {
                            showLoader();
                            await ref
                                .read(favoritesViewModelProvider)
                                .deleteFavoritesMovie(id);
                            hideLoader();
                          },
                        ),
                      );
                    },
                    childCount: data.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
