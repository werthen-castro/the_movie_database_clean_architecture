import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:the_movie_database_clean_arch/core/utils/keys.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/custom_button_widget.dart';

void main() {
  group('custom button', () {
    testWidgets('isSelected  false ', (tester) async {
      await tester.runAsync(() async {
        await _createCustomButtomWidget(
          tester,
          isSelected: false,
          title: 'titulo teste',
          onTap: () {
            print('x');
          },
        );

        await tester.pump();
        expect(find.byKey(const Key(Keys.customButtonWidget)), findsWidgets);

        await tester.tap(find.byKey(const Key(Keys.customButtonWidget)));
        await tester.pump();
      });
    });

    testWidgets('isSelected true ', (tester) async {
      await tester.runAsync(() async {
        await _createCustomButtomWidget(
          tester,
          isSelected: true,
          title: 'titulo teste',
          onTap: () {
            print('y');
          },
        );

        await tester.pump();
        expect(find.byKey(const Key(Keys.customButtonWidget)), findsWidgets);

        await tester.tap(find.byKey(const Key(Keys.customButtonWidget)));
        await tester.pump();
      });
    });
  });
}

Future _createCustomButtomWidget(
  WidgetTester tester, {
  required isSelected,
  required title,
  required onTap,
}) async {
  await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: CustomButtomWidget(
        isSelected: isSelected,
        onTap: onTap,
        title: title,
      ))));
}
