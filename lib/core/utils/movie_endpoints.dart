import 'const.dart';

class MovieEndpoints {
  static String movieForGenres(String apiKey, int page, int genreId) =>
      '${UrlsBase.urlBaseRequest}/discover/movie?api_key=$apiKey&with_genres=$genreId&page=$page&language=pt-BR';
}
