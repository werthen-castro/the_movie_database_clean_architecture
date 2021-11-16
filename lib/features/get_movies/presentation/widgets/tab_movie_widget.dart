import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_for_genre_use_case.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/controllers/tab_movie_controller.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/card_poster_widget.dart';

class TabMovieWidget extends StatefulWidget {
  final GetMovieForGenreUseCase? useCase;
  final int genredId;
  const TabMovieWidget({Key? key, this.useCase, required this.genredId})
      : super(key: key);

  @override
  _TabMovieWidgetState createState() => _TabMovieWidgetState();
}

class _TabMovieWidgetState extends State<TabMovieWidget> {
  late GetMovieForGenreUseCase _useCase;
  late TabMovieController tabPageController;

  @override
  void initState() {
    _useCase = widget.useCase ?? GetIt.instance.get<GetMovieForGenreUseCase>();
    tabPageController = TabMovieController(_useCase, widget.genredId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<List<MovieEntity>>(
          initialData: [],
          stream: tabPageController.listMovies,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return CardPosterWidget(
                        movieId: snapshot.data![index].id,
                        title: snapshot.data![index].title,
                        pathImage: snapshot.data![index].posterPath,
                        genreIds: snapshot.data![index].genreIds,
                      );
                    })
                : CircularProgressIndicator();
          }),
    );
  }
}
