import 'const.dart';

class MovieEndpoints {
  static String movieForGenres(String apiKey, int page, int genre) =>
      '${UrlsBase.urlBaseImage}/discover/movie?api_key=$apiKey&with_genres=$genre&page=$page&language=pt-BR';
}
