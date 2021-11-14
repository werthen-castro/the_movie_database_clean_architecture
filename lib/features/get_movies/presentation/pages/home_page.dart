import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/dio_client/dio_client_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/datasource/get_movies_data_source_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/repositories/get_movie_repository_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/card_poster_widget.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/custom_app_bar_widget.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/info_movie_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String url =
      'https://api.themoviedb.org/3/movie/popular?api_key=7894d961381ee2193e4a6cd702d59e62&language=pt-BR&page=1';

  DioClientImpl client = DioClientImpl();

  late GetMoviesDataSourceImpl datasource;

  late GetMovieRepository repository;

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);

    datasource = GetMoviesDataSourceImpl(client);
    repository = GetMovieRepositoryImpl(datasource);
  }

  Future<void> _incrementCounter() async {
    var res = await repository.getMovies(page: 1, genreId: 28);
    inspect(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        tabController: tabController,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              CardPosterWidget(
                title: 'title',
                pathImage: '/eDHOutMxLMgComnVhUK0Xfwunu5.jpg',
                genreIds: [28, 12, 14],
              ),
              CardPosterWidget(
                title: 'title',
                pathImage: '/ArrOBeio968bUuUOtEpKa1teIh4.jpg',
                genreIds: [28, 12, 14],
              ),
              CardPosterWidget(
                title: 'title',
                pathImage: '/cinER0ESG0eJ49kXlExM0MEWGxW.jpg',
                genreIds: [28, 12, 14],
              ),
            ],
          ),
          Container(
            color: Colors.black,
            width: 500,
            height: 500,
          ),
          Container(
            color: Colors.red,
            width: 500,
            height: 500,
          ),
          Container(
            color: Colors.blue,
            width: 500,
            height: 500,
          )
        ],
      ),
    );
  }
}
