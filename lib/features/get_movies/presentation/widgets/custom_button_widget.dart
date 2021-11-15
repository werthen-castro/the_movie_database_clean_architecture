import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_colors.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';

class CustomButtomWidget extends StatefulWidget {
  final String title;
  bool isSelected;
  final Function() onTap;
  CustomButtomWidget(
      {required this.title, required this.isSelected, required this.onTap});

  @override
  _CustomButtomWidgetState createState() => _CustomButtomWidgetState();
}

class _CustomButtomWidgetState extends State<CustomButtomWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(Keys.customButtonWidget),
      onTap: widget.onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Text(
            widget.title,
            style: TextStyle(
                color: widget.isSelected
                    ? CustomColors.whiteColor
                    : CustomColors.accentColor),
          ),
        ),
        height: 28,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? CustomColors.accentColor
              : CustomColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(26),
          ),
          border: Border.all(
            width: 1,
            color: widget.isSelected
                ? CustomColors.accentColor
                : CustomColors.borderColor,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
