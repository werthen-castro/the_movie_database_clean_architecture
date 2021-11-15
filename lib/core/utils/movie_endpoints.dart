import 'const.dart';
import 'movie_api_keys.dart';

class MovieEndpoints {
  static String movieForGenres(int page, int genreId) =>
      '${UrlsBase.urlBaseRequest}/discover/movie?api_key=${MoveiApiKeys.apiKey}&with_genres=$genreId&page=$page&language=pt-BR';

  static String movieForId(int movieId) =>
      'https://api.themoviedb.org/3/movie/$movieId?api_key=${MoveiApiKeys.apiKey}&language=pt-BR';

  static String searchMovie(String name, int page) =>
      'https://api.themoviedb.org/3/search/movie?api_key=${MoveiApiKeys.apiKey}&language=pt-BR&page=$page&include_adult=false&query=$name';

  static String peopleMovie(int movieId) =>
      'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=${MoveiApiKeys.apiKey}&language=pt-BR';
}
