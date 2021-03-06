import 'package:flutter/material.dart';

import 'core/config/injector.dart';
import 'features/get_movies/presentation/pages/home_page.dart';

void main() {
  Injector.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
