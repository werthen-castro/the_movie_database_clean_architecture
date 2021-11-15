import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/info_movie_widget.dart';

void main() {
  testWidgets(' InfoMovieWidget ', (tester) async {
    await tester.runAsync(() async {
      await _createInfoMovieWidget(tester,
          title: 'titulo teste', genreIds: [28, 12, 14]);

      await tester.pump();
      expect(find.byKey(const Key(Keys.infoMovieWidget)), findsWidgets);
    });
  });
}

Future _createInfoMovieWidget(
  WidgetTester tester, {
  required title,
  required genreIds,
}) async {
  await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: InfoMovieWidget(
        title: title,
        genreIds: genreIds,
      ))));
}
