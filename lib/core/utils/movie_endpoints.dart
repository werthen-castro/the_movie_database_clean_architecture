class MovieEndpoints {
  static String popular(String apiKey, int page) =>
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&page=$page";

  static String movieForGenres(String apiKey, int page, int genre) =>
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genre&page=$page';
}
