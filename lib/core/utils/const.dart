class UrlsBase {
  static String urlBaseImage = "https://image.tmdb.org/t/p/w500";
  static String urlBaseRequest = "https://api.themoviedb.org/3";
}

class Genres {
  static Map<int, String> mapGenres = {
    GenresIds.action: 'Ação',
    GenresIds.adventure: 'Aventura',
    GenresIds.animation: 'Animação',
    GenresIds.comedy: 'Comédia',
    GenresIds.crime: 'Policial',
    GenresIds.documentary: 'Documentário',
    GenresIds.drama: 'Drama',
    GenresIds.family: 'Família',
    GenresIds.fantasy: 'Fantasia',
    GenresIds.history: 'História',
    GenresIds.horror: 'Terror',
    GenresIds.music: 'Música',
    GenresIds.mystery: 'Misterio',
    GenresIds.romance: 'Romace',
    GenresIds.scienceFiction: 'Ficção Ciêntifica',
    GenresIds.tvMovie: 'Filme de TV',
    GenresIds.thriller: 'Suspense',
    GenresIds.war: 'Guerra',
    GenresIds.western: 'Faroeste'
  };
}

class GenresIds {
  static int action = 28;
  static int adventure = 12;
  static int animation = 16;
  static int comedy = 35;
  static int crime = 80;
  static int documentary = 99;
  static int drama = 18;
  static int family = 10751;
  static int fantasy = 14;
  static int history = 36;
  static int horror = 27;
  static int music = 10402;
  static int mystery = 9648;
  static int romance = 10749;
  static int scienceFiction = 878;
  static int tvMovie = 10770;
  static int thriller = 53;
  static int war = 10752;
  static int western = 37;
}
