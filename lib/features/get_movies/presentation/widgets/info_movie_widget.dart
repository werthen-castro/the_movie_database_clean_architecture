import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_font_styles.dart';
import 'package:the_movie_database_clean_arch/core/utils/formats.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';

class InfoMovieWidget extends StatelessWidget {
  final String title;
  final List genreIds;
  const InfoMovieWidget({Key? key, required this.title, required this.genreIds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key(Keys.infoMovieWidget),
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child:
                Text(title.toUpperCase(), style: CustomFontStyle.fontTitleCard),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(Formats.transformGenres(genreIds),
                style: CustomFontStyle.fontGenresCard),
          )
        ],
      ),
    );
  }
}
