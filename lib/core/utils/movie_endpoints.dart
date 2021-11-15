import 'const.dart';

class MovieEndpoints {
  static String movieForGenres(String apiKey, int page, int genreId) =>
      '${UrlsBase.urlBaseRequest}/discover/movie?api_key=$apiKey&with_genres=$genreId&page=$page&language=pt-BR';

  static String movieForId(String apiKey, int movieId) =>
      'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=pt-BR';

  static String searchMovie(String apiKey, int name, int page) =>
      'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=pt-BR&page=$page&include_adult=false&query=$name';

  static String peopleMovie(String apiKey, int movieId) =>
      'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=pt-BR';
}
