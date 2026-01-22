import 'dart:async';

import 'package:cinebox_app/ui/core/themes/colors.dart';
import 'package:cinebox_app/ui/core/themes/resource.dart';
import 'package:cinebox_app/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppbar extends ConsumerStatefulWidget {
  const MoviesAppbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppbarState();
}

class _MoviesAppbarState extends ConsumerState<MoviesAppbar> {

  Timer? _deboumce;
  final _searchController = TextEditingController();
  final _showClearButton = ValueNotifier<bool>(false);

  @override
  void initState() {
    _searchController.addListener(() {
      _showClearButton.value = _searchController.text.isNotEmpty;
    });
    super.initState();
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      _deboumce?.cancel();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
      return;
    }
    if (_deboumce?.isActive ?? false) _deboumce?.cancel();
    _deboumce = Timer(Duration(microseconds: 500), () {
      FocusScope.of(context).unfocus();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesBySearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
        ),
        titlePadding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        title: SizedBox(
          height: 36,
          child: TextFormField(
            controller: _searchController,
            onChanged: onSearchChanged,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: 'Procurar filmes',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 15,
                ),
              ),
              suffixIcon: ValueListenableBuilder(
                valueListenable: _showClearButton,
                builder: (context, value, child) {
                  return Visibility(
                    visible: value,
                    child: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        FocusScope.of(context).unfocus();
                        ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.lightGrey,
                        size: 15,
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
