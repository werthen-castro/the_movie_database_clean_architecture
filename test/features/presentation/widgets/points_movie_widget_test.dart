import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/points_movie_widget.dart';

void main() {
  group('PointsMovieWidget', () {
    testWidgets(' voteAverage 10.0 ', (tester) async {
      await tester.runAsync(() async {
        await _createPointsMovieWidget(
          tester,
          voteAverage: 10.0,
        );

        await tester.pump();
        expect(find.byKey(const Key(Keys.pointsMovieWidget)), findsWidgets);
      });
    });

    testWidgets(' voteAverage 0.0 ', (tester) async {
      await tester.runAsync(() async {
        await _createPointsMovieWidget(
          tester,
          voteAverage: 0.0,
        );

        await tester.pump();
        expect(find.byKey(const Key(Keys.pointsMovieWidget)), findsWidgets);
      });
    });
  });
}

Future _createPointsMovieWidget(
  WidgetTester tester, {
  required voteAverage,
}) async {
  await tester.pumpWidget(MaterialApp(
      home: PointsMovieWidget(
    voteAverage: voteAverage,
  )));
}
