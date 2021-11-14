import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/utils/const.dart';

import 'info_movie_widget.dart';

class CardPosterWidget extends StatelessWidget {
  final String pathImage;
  final String title;
  final List genreIds;

  const CardPosterWidget({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.genreIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
