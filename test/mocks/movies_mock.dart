import 'package:the_movie_database_clean_arch/features/get_movies/data/models/movie_model.dart';

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
