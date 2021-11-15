import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/tag_genre_movie_widget.dart';

void main() {
  testWidgets(' TagGenreMovieWidget ', (tester) async {
    await tester.runAsync(() async {
      await _createTagGenreMovieWidget(
        tester,
        text: 'action',
      );

      await tester.pump();
      expect(find.byKey(const Key(Keys.tagGenreMovieWidget)), findsWidgets);
    });
  });
}

Future _createTagGenreMovieWidget(
  WidgetTester tester, {
  required text,
}) async {
  await tester.pumpWidget(MaterialApp(
      home: TagGenreMovieWidget(
    text: text,
  )));
}
