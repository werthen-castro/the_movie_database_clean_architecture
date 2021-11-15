import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_colors.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_font_styles.dart';

class PointsMovieWidget extends StatelessWidget {
  final double voteAverage;
  const PointsMovieWidget({Key? key, required this.voteAverage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: voteAverage.toString() + ' ',
              style: CustomFontStyle.voteAverage),
          TextSpan(
              text: '/ 10',
              style: CustomFontStyle.fontTitleCard
                  .copyWith(color: CustomColors.grayDarkColor)),
        ],
      ),
    );
  }
}
