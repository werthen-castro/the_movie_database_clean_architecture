import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/card_poster_widget.dart';

void main() {
  setUpAll(() {});

  testWidgets('Card Poster', (tester) async {
    await tester.runAsync(() async {
      await _createCardPosterWidget(
        tester,
        pathImage: "/cinER0ESG0eJ49kXlExM0MEWGxW.jpg",
        title: 'titulo teste',
        genreIds: [28, 12, 14],
      );

      await tester.pump();
      expect(find.byKey(const Key(Keys.cardPosterWidget)), findsWidgets);
    });
  });
}

Future _createCardPosterWidget(
  WidgetTester tester, {
  key,
  required pathImage,
  required title,
  required genreIds,
}) async {
  await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: CardPosterWidget(
        movieId: 1,
        key: key,
        pathImage: pathImage,
        title: title,
        genreIds: genreIds,
      ))));
}
