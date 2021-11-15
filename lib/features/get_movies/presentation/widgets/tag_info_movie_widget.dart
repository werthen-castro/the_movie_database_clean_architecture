import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_colors.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_font_styles.dart';

class TagInfoMovieWidget extends StatelessWidget {
  final String description;
  final String value;
  final double? tagWidth;
  const TagInfoMovieWidget(
      {Key? key, required this.description, required this.value, this.tagWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tagWidth,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: description + ': ',
                    style: CustomFontStyle.fontTitleCard
                        .copyWith(color: CustomColors.grayDarkColor)),
                TextSpan(
                    text: value,
                    style: CustomFontStyle.fontTitleCard
                        .copyWith(color: CustomColors.grayDarkColor)),
              ],
            ),
          )),
      decoration: BoxDecoration(
        color: CustomColors.borderColor,
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
