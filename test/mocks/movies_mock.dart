import 'package:the_movie_database_clean_arch/features/get_movies/data/models/details_movie_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/genre_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/movie_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/production_companies_model.dart';

String listMoviesMock = """ {
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/efuPybo8V8KTYGslQphO74LRvm0.jpg",
            "genre_ids": [
                878,
                28,
                12
            ],
            "id": 580489,
            "original_language": "en",
            "original_title": "Venom: Let There Be Carnage",
            "overview": "O relacionamento entre Eddie e Venom (Tom Hardy) está evoluindo. Buscando a melhor forma de lidar com a inevitável simbiose, esse dois lados descobrem como viver juntos e, de alguma forma, se tornarem melhores juntos do que separados.",
            "popularity": 4497.836,
            "poster_path": "/h5UzYZquMwO9FVn15R2eK2itmHu.jpg",
            "release_date": "2021-09-30",
            "title": "Venom: Tempo de Carnificina",
            "video": false,
            "vote_average": 6.8,
            "vote_count": 1823
        },
        {
            "adult": false,
            "backdrop_path": "/cinER0ESG0eJ49kXlExM0MEWGxW.jpg",
            "genre_ids": [
                28,
                12,
                14
            ],
            "id": 566525,
            "original_language": "en",
            "original_title": "Shang-Chi and the Legend of the Ten Rings",
            "overview": "Shang-Chi precisa confrontar o passado que pensou ter deixado para trás. Ao mesmo tempo, ele é envolvido em uma teia de mistérios da organização conhecida como Dez Anéis.",
            "popularity": 3641.782,
            "poster_path": "/ArrOBeio968bUuUOtEpKa1teIh4.jpg",
            "release_date": "2021-09-01",
            "title": "Shang-Chi e a Lenda dos Dez Anéis",
            "video": false,
            "vote_average": 7.9,
            "vote_count": 1999
        }
    ],
    "total_pages": 500,
    "total_results": 10000
} """;

String movieModelJsonMock = """ 
        {
            "adult": false,
            "backdrop_path": "/efuPybo8V8KTYGslQphO74LRvm0.jpg",
            "genre_ids": [
                878,
                28,
                12
            ],
            "id": 580489,
            "original_language": "en",
            "original_title": "Venom: Let There Be Carnage",
            "overview": "O relacionamento entre Eddie e Venom (Tom Hardy) está evoluindo. Buscando a melhor forma de lidar com a inevitável simbiose, esse dois lados descobrem como viver juntos e, de alguma forma, se tornarem melhores juntos do que separados.",
            "popularity": 4497.836,
            "poster_path": "/h5UzYZquMwO9FVn15R2eK2itmHu.jpg",
            "release_date": "2021-09-30",
            "title": "Venom: Tempo de Carnificina",
            "video": false,
            "vote_average": 6.8,
            "vote_count": 1823
        }
""";

String mockGenreJson = """ 
      {
            "id": 28,
            "name": "Ação"
        }
        """;

String mockListGenresJson = """ 
[
  {
            "id": 28,
            "name": "Ação"
        },
        {
            "id": 12,
            "name": "Aventura"
        },
        {
            "id": 14,
            "name": "Fantasia"
        }
        ]""";

GenreModel mockGenreModel = GenreModel(id: 28, name: 'Ação');

List<GenreModel> mockListGenreModel = [
  mockGenreModel,
  GenreModel(id: 12, name: 'Aventura'),
  GenreModel(id: 14, name: 'Fantasia'),
];

String mockProductionCompanieJson = """  
        {
            "id": 420,
            "logo_path": "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
            "name": "Marvel Studios",
            "origin_country": "US"
        }
    """;
ProductionCompaniesModel productionCompaniesModel =
    ProductionCompaniesModel(id: 420, name: 'Marvel Studios');

String mockDetailsMovie = """ 
{
    "adult": false,
    "backdrop_path": "/cinER0ESG0eJ49kXlExM0MEWGxW.jpg",
    "belongs_to_collection": null,
    "budget": 150000000,
    "genres": [
        {
            "id": 28,
            "name": "Ação"
        },
        {
            "id": 12,
            "name": "Aventura"
        },
        {
            "id": 14,
            "name": "Fantasia"
        }
    ],
    "homepage": "https://www.marvel.com/movies/shang-chi-and-the-legend-of-the-ten-rings",
    "id": 566525,
    "imdb_id": "tt9376612",
    "original_language": "en",
    "original_title": "Shang-Chi and the Legend of the Ten Rings",
    "overview": "Shang-Chi precisa confrontar o passado que pensou ter deixado para trás. Ao mesmo tempo, ele é envolvido em uma teia de mistérios da organização conhecida como Dez Anéis.",
    "popularity": 7137.893,
    "poster_path": "/ArrOBeio968bUuUOtEpKa1teIh4.jpg",
    "production_companies": [
        {
            "id": 420,
            "logo_path": "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
            "name": "Marvel Studios",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2021-09-01",
    "revenue": 430238384,
    "runtime": 132,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        },
        {
            "english_name": "Mandarin",
            "iso_639_1": "zh",
            "name": "普通话"
        }
    ],
    "status": "Released",
    "tagline": "Você não pode fugir do seu destino.",
    "title": "Shang-Chi e a Lenda dos Dez Anéis",
    "video": false,
    "vote_average": 7.9,
    "vote_count": 2605
}""";

DetailsMovieModel mockeDethailsMovieModel = DetailsMovieModel(
    budget: 150000000,
    genres: mockListGenreModel,
    originalTitle: 'Shang-Chi and the Legend of the Ten Rings',
    id: 566525,
    overview:
        'Shang-Chi precisa confrontar o passado que pensou ter deixado para trás. Ao mesmo tempo, ele é envolvido em uma teia de mistérios da organização conhecida como Dez Anéis.',
    posterPath: '/ArrOBeio968bUuUOtEpKa1teIh4.jpg',
    releaseDate: '2021-09-01',
    productionCompanies: [productionCompaniesModel],
    status: 'Released',
    tagline: 'Você não pode fugir do seu destino.',
    title: 'Shang-Chi e a Lenda dos Dez Anéis',
    voteAverage: 7.9,
    runtime: 132);

MovieModel movieModelMock = const MovieModel(
  id: 580489,
  posterPath: '/h5UzYZquMwO9FVn15R2eK2itmHu.jpg',
  title: 'Venom: Tempo de Carnificina',
  genreIds: [878, 28, 12],
);

List<MovieModel> listMovieModelMock = [
  movieModelMock,
  const MovieModel(
    id: 566525,
    posterPath: '/ArrOBeio968bUuUOtEpKa1teIh4.jpg',
    title: 'Shang-Chi e a Lenda dos Dez Anéis',
    genreIds: [28, 12, 14],
  )
];
