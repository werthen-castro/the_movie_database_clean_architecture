import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/utils/const.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/pages/details_movie_page.dart';

import 'info_movie_widget.dart';

class CardPosterWidget extends StatelessWidget {
  final String pathImage;
  final String title;
  final List genreIds;
  final int movieId;

  const CardPosterWidget(
      {Key? key,
      required this.pathImage,
      required this.title,
      required this.genreIds,
      required this.movieId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key(Keys.cardPosterWidget),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsMoviePage(id: movieId)));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26.0),
          child: Stack(
            children: [
              Image.network(UrlsBase.urlBaseImage + pathImage),
              Positioned(
                bottom: 0,
                child: InfoMovieWidget(
                  title: title,
                  genreIds: genreIds,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
