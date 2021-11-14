import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AppBarController {
  final _genreSelected = BehaviorSubject<int>.seeded(0);
  Stream<int> get genreSelected => _genreSelected.stream;

  changeGenreSelected(int index, TabController controller) {
    _genreSelected.add(index);
    controller.animateTo(index);
  }
}
