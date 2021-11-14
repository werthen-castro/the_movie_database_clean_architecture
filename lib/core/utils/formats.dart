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
}
