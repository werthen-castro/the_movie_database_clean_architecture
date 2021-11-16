import 'package:intl/intl.dart';

import 'const.dart';

class Formats {
  static String transformGenres(List genreIds) {
    String genres = '';
    for (int i = 0; i < genreIds.length; i++) {
      genres += Genres.mapGenres[genreIds[i]] ?? '';
      genres += i + 1 != genreIds.length ? ' - ' : '';
    }

    return genres;
  }

  static String formaterYaer(String date) {
    List<String> list = date.split('-');
    return list[0];
  }

  static String formaterDuration(int time) {
    var hours = time ~/ 60;
    var minutos = time % 60;
    return '${hours}h $minutos min';
  }
}
