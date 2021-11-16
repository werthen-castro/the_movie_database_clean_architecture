import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_font_styles.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.arrow_back_ios),
                ),
                const Text(
                  'Voltar',
                  style: CustomFontStyle.backButton,
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
