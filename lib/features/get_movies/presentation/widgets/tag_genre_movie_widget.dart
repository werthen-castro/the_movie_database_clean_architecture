import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_colors.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_font_styles.dart';

class TagGenreMovieWidget extends StatelessWidget {
  final String text;

  const TagGenreMovieWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(text.toUpperCase(), style: CustomFontStyle.infoGenreCard),
      ),
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: CustomColors.borderColor,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
