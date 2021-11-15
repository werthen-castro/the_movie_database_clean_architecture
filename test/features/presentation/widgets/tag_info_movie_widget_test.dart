import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/tag_info_movie_widget.dart';

void main() {
  group('TagGenreMovieWidget', () {
    testWidgets('with   tagWidth', (tester) async {
      await tester.runAsync(() async {
        await _createTagInfoMovieWidget(tester,
            description: 'descrição', value: 'valor', tagWidth: 100.0);

        await tester.pump();
        expect(find.byKey(const Key(Keys.tagInfoMovieWidget)), findsWidgets);
      });
    });

    testWidgets('without   tagWidth', (tester) async {
      await tester.runAsync(() async {
        await _createTagInfoMovieWidget(tester,
            description: 'descrição', value: 'valor');

        await tester.pump();
        expect(find.byKey(const Key(Keys.tagInfoMovieWidget)), findsWidgets);
      });
    });
  });
}

Future _createTagInfoMovieWidget(WidgetTester tester,
    {required description, required value, tagWidth}) async {
  await tester.pumpWidget(MaterialApp(
      home: TagInfoMovieWidget(
          description: description, value: value, tagWidth: tagWidth)));
}
